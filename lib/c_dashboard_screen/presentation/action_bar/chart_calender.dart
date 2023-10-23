import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:http/http.dart' as http;


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
  RestorableDateTime( DateTime.now(),);
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(

          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate:DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2050),
        );
      },
    );
  }
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(()
          {
            _selectedDate.value = newSelectedDate;
            final d=_selectedDate.value.day;
            final m=_selectedDate.value.month;
            final y=_selectedDate.value.year;
            resu(d:d,m:m,y:y);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
            style: TextStyle(color: Colors.black),),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
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
                onPressed: () {
                  _restorableDatePickerRouteFuture.present();
                }, icon: Icon(Icons.calendar_month),

              ),
            ),
          ],
      ),
       );

  }


    Future<List<Album>> resu({required int d, required int m, required int y}) async{
      print('aaaaaaaaaaaaaaaeeeeeeeeeeeeaaaaaaaaaaaaa');
      final response = await http.post(
        Uri.parse(Apiconst.baseurl+'year'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "year":"$y",
          "date":"$d",
          "month":"$m"
        })
      );
      var jsond = json.decode(response.body)["country"];
      print(jsond);
      List<Album> allround = [];
      for (var o in jsond)  {
        Album al = Album(
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
      return allround;
    }


  }




class Album {
  String id;
  String gamename;
  String time;
  String date;
  String year;
  String month;
  String result;
  Album(this.id,this.gamename,this.time,
      this.date,this.year,this.month,this.result,
      );

}
