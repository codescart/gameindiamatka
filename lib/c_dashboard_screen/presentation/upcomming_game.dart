import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/upcoming_result_page.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';

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
  Album(this.id,this.market_name,this.market_result,
      this.batting_openingtime,this.batting_close_time,this.result,this.format,this.date,this.month,this.year
      );

}
Future<List<Album>> bow() async{
  final response = await http.get(
    Uri.parse(Apiconst.baseurl+'upcoming_game'),

  );
  var jsond = json.decode(response.body)["data"];
  print(jsond);
  print('wwwwwwwwwwwwwwwwwwwwwwwww');
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
    );

    allround.add(al);
  }
  return allround;
}
class UpcommingGame extends StatefulWidget {
  const UpcommingGame({Key? key}) : super(key: key);

  @override
  State<UpcommingGame> createState() => _UpcommingGameState();
}

class _UpcommingGameState extends State<UpcommingGame> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
        future: bow(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? GridView.builder(
            shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                print(snapshot.data!.length);
                return InkWell(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> UpcommingResult()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0,bottom: 8),
                    child: Container(
                      padding: EdgeInsets.only(top: 10,),
                      color: AppConstant.secondaryColor,
                      child: Container(
                        child: Column(
                          children: [
                          CircleAvatar(
                              backgroundColor: AppConstant.primaryColor,
                              radius: 30.r,
                              child: CircleAvatar(
                                backgroundColor: AppConstant.secondaryColor,
                                radius: 25.r,
                                child: Icon(
                                  Icons.apartment_rounded,
                                  color: AppConstant.titlecolor,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                          Text(
                              '${snapshot.data![index].market_name}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4,
                            ),
                            SizedBox(height: 10,),
                            Text("Bet Close "'${snapshot.data![index].batting_close_time}'+'${snapshot.data![index].format}',style: TextStyle(fontSize: 10), ),
                            SizedBox(height: 10,),
                            Text("Bet Result "'${snapshot.data![index].result}',style: TextStyle(fontSize: 10),),

                          ],
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
