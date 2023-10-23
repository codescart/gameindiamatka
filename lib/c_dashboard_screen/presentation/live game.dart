import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/games.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Album {
  String? id;
  String? market_name;
  String? market_result;
  String? batting_openingtime;
  String? batting_close_time;
  String? result;
  String? format;
  String? date;
  String? month;
  String? year;
  String? number;




  Album(this.id,this.market_name,this.market_result,
      this.batting_openingtime,this.batting_close_time,this.result,this.format,this.date,this.month,this.year,this.number
      );

}
Future<List<Album>> bow() async{


  final response = await http.get(
    Uri.parse(Apiconst.baseurl+'gamelive'),

  );
  var jsond = json.decode(response.body)["data"];
  print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
  print(jsond);
  print('ffffffffffffffffffffffffffffffffffff');
  List<Album> allround = [];
  for (var o in jsond)  {
    Album al = Album(
      o["id"],
      o["market_name"],
      o["market_result"],
      o["batting_openingtime"],
      o["batting_close_time"],
      o["result"],
      o["format"],
      o["date"],
      o["month"],
      o["year"],
      o["number"],

    );

    allround.add(al);
  }
  return allround;
}




class Livegame extends StatefulWidget {
  const Livegame({Key? key}) : super(key: key);

  @override
  State<Livegame> createState() => _LivegameState();
}

class _LivegameState extends State<Livegame> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
        future: bow(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                print(snapshot.data!.length);
                return InkWell(
                  onTap: ()async{
                    final prefs1 = await SharedPreferences
                        .getInstance();
                    final key1 = 'gameid';
                    final mobile = snapshot.data![index].id ;
                    prefs1.setString(key1, mobile! );

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> Games(
                            id:'${snapshot.data![index].id}', name:"${snapshot.data![index].market_name}")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: AppConstant.secondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 25.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.secondaryColor,
                              radius: 20.r,
                              child: Icon(
                                Icons.apartment_rounded,
                                color: AppConstant.titlecolor,
                                size: 18.sp,
                              ),
                            ),
                          ),
                          title: Text(
                            '${snapshot.data![index].market_name}',

                            style: Theme
                                .of(context)
                                .textTheme
                                .headline4,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(right:80),
                            child: Column(
                              children: [
                                Text( '${snapshot.data![index].number}'+"+ people are playing",style:TextStyle(fontSize: 8)),
                                SizedBox(height: 5,),
                                Container(
                                  height: 20,width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4.sp),
                                  ),
                                  child: Center(child: Text("BETTING OPEN",style:TextStyle(fontSize: 12))),
                                ),
                              ],
                            ),
                          ),
                          trailing: Column(
                            children: [
                              Icon(
                                Icons.play_circle_fill_rounded,
                                size: 34.sp,
                                color: AppConstant.primaryColor,
                              ),
                              Text(
                                "Play",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
          ) : Center(child: Text("Wait for List"));
        });
  }
}