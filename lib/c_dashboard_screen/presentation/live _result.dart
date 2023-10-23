import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';

class Album {
  String id;
  String market_name;
  String market_result;
  String batting_openingtime;
  String batting_close_time;
  String result;
  String format;
  String date;
  String month;
  String year;




  Album(this.id,this.market_name,this.market_result,
      this.batting_openingtime,this.batting_close_time,this.result,this.format,this.date,this.month,this.year
      );

}
Future<List<Album>> bow() async{
  final response = await http.get(
    Uri.parse(Apiconst.baseurl+'resultslive'),

  );
  var jsond = json.decode(response.body)["data"];
  print(jsond);
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

class LiveResult extends StatefulWidget {
  const LiveResult({Key? key}) : super(key: key);

  @override
  State<LiveResult> createState() => _LiveResultState();
}

class _LiveResultState extends State<LiveResult> {
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
                          '${snapshot.data![index].market_name}',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4,
                        ),
                        subtitle: Text(
                          "Today's winner Number",
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

                              '${snapshot.data![index].market_result}',
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
    );
  }
}
