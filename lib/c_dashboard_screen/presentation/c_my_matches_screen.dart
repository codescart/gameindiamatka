import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyMatchesScreen extends StatelessWidget {
  const MyMatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.control_point_duplicate),
        title: const Text('My Match'),
      ),
      body:  FutureBuilder<List<Album>>(
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
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: AppConstant.secondaryColor,
                      child: Column(
                        children: [
                          snapshot.data![index].winstatus =='1'?
                          Container(
                            height: 20,width: 250,
                            decoration: BoxDecoration(
                              color:Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Center(child: Text("WINNER")),
                          ): Container(),
                          ListTile(
                            title:Text('${snapshot.data![index].gameid}'),
                            leading: Text('\u{20B9}'+'${snapshot.data![index].amount}',
                              style: TextStyle(
                              fontSize: 30,
                            ),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bet Date'+' '+'${snapshot.data![index].betdate}'),
                                Text('Bet Time '+'${snapshot.data![index].date_time}'+'  '+'${snapshot.data![index].time}'),
                              ],
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                color:
                              snapshot.data![index].winstatus=='1'?
                              AppConstant.primaryColor :AppConstant.secondaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.r),
                                  bottomLeft: Radius.circular(8.r),
                                  topRight: Radius.circular(8.r),
                                  bottomRight: Radius.circular(8.r),

                                ),
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 12.0,
                                ),
                                child: Text('${snapshot.data![index].number}', style:
                                Theme
                                    .of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                  color:Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),),
                              ),




                            ),
                          ),
                        ],
                      ),
                    ));
                }
            ):Center(child: Text("Wait For History"));
          }
      )
    );
  }
}
class Album {
  String gameid;
  String number;
  String amount;
  String date_time;
  String time;
  String betdate;
  String winstatus;






  Album(this.gameid,this.number,this.amount, this.date_time,this.time,this.betdate,this.winstatus);

}
Future<List<Album>> bow() async{
  final prefs = await SharedPreferences.getInstance();
  final key = 'user_id';
  final value = prefs.getString(key) ?? "0";
  final response = await http.post(
    Uri.parse(Apiconst.baseurl+'battinghistory'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id":"$value"
      }),

  );
  var jsond = json.decode(response.body)["country"];
  print(jsond);
  List<Album> allround = [];
  for (var o in jsond)  {
    Album al = Album(
        o["gameid"],
        o["number"],
        o["amount"],
        o["date_time"],
        o["time"],
        o["betdate"],
        o["winstatus"],

    );

  allround.add(al);
  }
  return allround;
}
