import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:http/http.dart' as http;
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';

import 'package:shared_preferences/shared_preferences.dart';



class list extends StatefulWidget {
  final String Time;
  final String Name;
  final String Time2;
  final String Formate;
  final String Result;
  const   list({Key? key, required this.Time, required this.Name, required this.Time2, required this.Formate, required this.Result, }) : super(key: key);

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:CustomBackButton(),
      ),
      body:
      Center(
        child: Column(
            children:[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppConstant.secondaryColor
                ),
                height: 500,width: 320,

                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black12
                      ),
                      height: 50,width: 320,
                      child: Center(child: Text(widget.Name,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),)),
                    ),
                    Container(
                      color: AppConstant.secondaryColor,
                      height: 400,
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: AppConstant.primaryColor,
                              radius: 50.r,
                              child: CircleAvatar(
                                backgroundColor: AppConstant.secondaryColor,
                                radius: 45.r,
                                child: Icon(
                                  Icons.apartment_rounded,
                                  color: AppConstant.titlecolor,
                                  size: 40.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Center(child: Column(
                            children: [
                              Text('Declares only one lucky number in a day that is same',style: Theme.of(context).textTheme.subtitle2,),
                              Text('followed by all our country',style: Theme.of(context).textTheme.subtitle2,),
                              SizedBox(height: 7,),
                              Text('_________________________'),
                              SizedBox(height: 7,),
                              Text('You can win huge money by placing that on your',style: Theme.of(context).textTheme.subtitle2,),
                              Text('lucky number',style: Theme.of(context).textTheme.subtitle2,),
                              SizedBox(height: 30,),

                            ],
                          )),

                          SizedBox(height: 51,),

                          Container(
                            height: 70,width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color:AppConstant.titlecolor)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 55.0,top: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Bet Open"),
                                      SizedBox(width: 10,),
                                      Text(widget.Time2),
                                      // Text(widget.Formate)

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Bet Close"),
                                      SizedBox(width: 10,),
                                      Text(widget.Time),
                                      // Text(widget.Formate)

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Bet Result"),
                                      SizedBox(width: 10,),
                                      Text(widget.Result),
                                    ],
                                  ),
                                ],
                              ),
                            ),


                          ),
                        ],
                      ),


                    ),
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}

