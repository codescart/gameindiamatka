import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
class Album {
  String id;
  String gameid;
  String time;
  String status;
  String gamename;
  String number;

  Album(this.id,this.gameid,this.time,this.status,this.gamename,this.number
      );

}
Future<List<Album>> bow() async{
  final response = await http.post(
    Uri.parse(Apiconst.baseurl+'resultslive'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "gameid":"1"
    }),

  );
  var jsond = json.decode(response.body)["data"];
  print(jsond);
  List<Album> allround = [];
  for (var o in jsond)  {
    Album al = Album(
      o["id"],
      o["gameid"],
      o["time"],
      o["status"],
      o["gamename"],
      o["number"],


    );

    allround.add(al);
  }
  return allround;
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Notification"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.keyboard_arrow_left_rounded,
          ),
        ),
      ),
      body: Container(
        color: AppConstant.secondaryColor,
        child: FutureBuilder<List<Album>>(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: CircleAvatar(
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
                        ),
                        title: Text(
                          '${snapshot.data![index].gamename}',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4,
                        ),
                        subtitle: Text(
                          'Winner Number',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                            color: AppConstant.subtitlecolor,
                          ),
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: AppConstant.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              bottomLeft: Radius.circular(8.r),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            child: Text(

                              '${snapshot.data![index].number}',
                              style:
                              Theme
                                  .of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                color: AppConstant.backgroundColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
          ):Center(child: Text("Wait For Result"));
        }
    )
    )
    );
  }
}
