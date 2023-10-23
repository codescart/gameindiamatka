import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/chartdeatil.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key, this.restorationId}) : super(key: key);
  final String? restorationId;

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  Future ?reportList;
  @override
  String? get restorationId => widget.restorationId;
@override



  DateTime selectedDate = DateTime.now();
  String formattedDate = "";
  String day = "";
  String month = "";
  String year = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(primary: AppConstant.primaryColor, ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = "${picked.day}/${picked.month}/${picked.year}";
        day = "${picked.day}";
        month = "${picked.month}";
        year = "${picked.year}";
      });
    }
  }
  void initState() {

    reportList = resu();
    day = "${selectedDate.day}";
    month = "${selectedDate.month}";
    year = "${selectedDate.year}";
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.bar_chart),
          title: const Text('Charts'),
        ),
        body:
        ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [

        Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Row(
          children: [
            Text('Select Date to see the winners'),
            Spacer(),

            Container(
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: IconButton(
                  onPressed: () => _selectDate(context),
                icon: Icon(Icons.calendar_month),

              ),
            ),
          ],
        ),
      ),
            FutureBuilder<List<Albumd>>(
              future: resu(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Container(
                    height: 300.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(formattedDate.toString(),
                            style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 30.h,),
                        Center(
                          child: Text('No Data Found'),
                        ),
                      ],
                    ),
                  );
                }
                else {
                  return ListView.builder(
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
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 120),
                                      child: Text(
                                        'Winner Number',
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                          color: AppConstant.subtitlecolor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${snapshot.data![index].date}',
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                              color: AppConstant.subtitlecolor,
                                            ),
                                          ),
                                          Text("|",style: Theme
                                              .of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                            color: AppConstant.subtitlecolor,
                                          ),),
                                          Text(
                                            '${snapshot.data![index].month}',
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                              color: AppConstant.subtitlecolor,
                                            ),
                                          ),
                                          Text("|",style: Theme
                                              .of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                            color: AppConstant.subtitlecolor,
                                          ),),
                                          Text(
                                            '${snapshot.data![index].year}',
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                              color: AppConstant.subtitlecolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
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

                                      '${snapshot.data![index].result}',
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
                  );
                }
              },
            ),

          ],
        ),
      ),
    );
  }
  Future<List<Albumd>> resu() async{
    print('qqqqqqqqqqqqqqqqqqq');
    print(year);
    print(month);
    print(day);
    print(formattedDate);


    print('aaaaaaaaaaaaaaaeeeeeeeeeeeeaaaaaaaaaaaaa');
    final response = await http.post(
        Uri.parse(Apiconst.baseurl+'year'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "year":'$year',
          "date":'$day',
          "month":'$month'
        })
    );
    var jsond = json.decode(response.body)["country"];

    List<Albumd> allround = [];
    for (var o in jsond)  {
      Albumd al = Albumd(
        o["id"],
        o["gamename"],
        o["time"],
        o["date"],
        o["year"],
        o["month"],
        o["result"],
      );

      allround.add(al);
    }

    print('aaaaaaaaaaaaaaaeeeeeeeeeeeeaaaaaaaaaaaaa');
    return allround;
  }

}
class Albumd {
  String ?id;
  String ?gamename;
  String ?time;
  String? date;
  String ?year;
  String ?month;
  String ?result;
  Albumd(this.id,this.gamename,this.time,
      this.date,this.year,this.month,this.result,
      );

}
