import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/add_cash.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/withdraw_cash.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {


  void initState() {
    leader();
    // TODO: implement initState
    super.initState();
  }

  var map;
  Future leader() async{

    // final prefs = await SharedPreferences.getInstance();
    // final key = 'mobile';
    // final value = prefs.getString(key) ?? 0;
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.post(
      Uri.parse(Apiconst.baseurl+'userpro'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id":"$value"
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    if (data['error'] == '200') {
      setState(() {
        map=json.decode(response.body)['country'];


      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.keyboard_arrow_left_rounded,
          ),
        ),
      ),
      body: map ==null?Center(child: CircularProgressIndicator()):
      Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  // width: width,
                  // height: 120.h,
                  decoration: BoxDecoration(
                    color: AppConstant.secondaryColor,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'My Money',
                            style:
                            Theme.of(context).textTheme.headline2!.copyWith(
                              color: AppConstant.subtitlecolor,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: 7.5,
                                left: -15,
                                child: Text(
                                  '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                map['wallet'] == ''?
                                '\u{20B9}'+'0' : '\u{20B9}'+map['wallet'].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                  fontSize: 36.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                            ],
                          ),
                          Container(
                            height: 30,width: 200,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6.sp),
                            ),
                            child: Center(child: Text("100% safe & Secure")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      // width: width,
                      // height: 120.h,
                      decoration: BoxDecoration(
                        color: AppConstant.secondaryColor,
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 100,width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Text(
                                    'Deposit',
                                    style:TextStyle(color: AppConstant.subtitlecolor,),
                                  ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: 7.5,
                                      left: -15,
                                      child: Text(
                                        '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      map['wallet'] == ''?
                                      '\u{20B9}'+'0' : '\u{20B9}'+map['wallet'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // width: width,
                      // height: 120.h,
                      decoration: BoxDecoration(
                        color: AppConstant.secondaryColor,
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 100,width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bonus',
                                  style:TextStyle(color: AppConstant.subtitlecolor,),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: 7.5,
                                      left: -15,
                                      child: Text(
                                        '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                          fontSize: 36.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      map['bonus'] == ''?
                                      '\u{20B9}'+'0' : '\u{20B9}'+map['bonus'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                        fontSize: 36.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,width: 150,
                      child: CustomButton(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          },
                        text: 'ADD CASH ',
                        textColor: AppConstant.titlecolor,
                        btnColor: Colors.transparent,
                        border: Border.all(
                          color: AppConstant.titlecolor,
                          width: 2,
                        ),
                      ),
                    ),
                    Container(
                      child: ButtonTheme(
                        height: 40,
                        minWidth: 150,
                        child: RaisedButton(
                          color:AppConstant.primaryColor,
                          child: Text("WITHDRAW CASH"),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WithdrawCash()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25,),

            ],
          ),




        ),
      ),

    );
  }
}
