import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/action_bar/withdraw_hisrory.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class WithdrawCash extends StatefulWidget {
  const WithdrawCash({Key? key}) : super(key: key);

  @override
  State<WithdrawCash> createState() => _WithdrawCashState();
}





class _WithdrawCashState extends State<WithdrawCash> {
  final amoount = TextEditingController();
  final Name = TextEditingController();
  final Money = TextEditingController();



  Future leader(String amoount, String Name, String Money) async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";

    final response = await http.post(
      Uri.parse(Apiconst.baseurl+'withdrawl_1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{

        "user_id": "$value",
        "upi": Money,
        "amount": amoount,
        "name":Name,
      }),
    );
     var data = jsonDecode(response.body);
    print(data);
    if (data['error'] == '200') {
      Fluttertoast.showToast(
          msg: "Withdraw  SucessFully placed withdraw will released at 8:00am to 12:00 pm",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

    }else{
      Fluttertoast.showToast(
          msg: data['msg'] ,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:CustomBackButton(),
        title: Text("Withdraw Cash"),
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Amount',
                          style:
                          Theme.of(context).textTheme.headline2!.copyWith(
                            color: AppConstant.subtitlecolor,
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Container(
                          width: 100,
                          alignment: Alignment.center,
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 40,
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:AppConstant.secondaryColor,
                                ),
                              ),
                              hintText: "00",),
                            controller: amoount,
                          ),
                        ),
                        SizedBox( height: 40,),
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
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Enter UPI Id"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50, width: 320,
                decoration: BoxDecoration(
                  color: AppConstant.secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) return;

                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppConstant.secondaryColor,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppConstant.secondaryColor,
                          width: 2,
                        )),

                    prefixIcon: Icon(
                      Icons.import_contacts, size: 16,
                      color: Colors.white,
                    ),
                    hintText: "Enter Your UPI Number",
                  ),


                  controller: Money,

                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Enter Account Holder Name"),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50, width: 320,
                decoration: BoxDecoration(
                  color: AppConstant.secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) return;

                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppConstant.secondaryColor,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppConstant.secondaryColor,
                          width: 2,
                        )),

                    prefixIcon: Icon(
                      Icons.import_contacts, size: 16,
                      color: Colors.white,
                    ),
                    hintText: "Enter Account Holder Name",
                  ),


                  controller:Name,

                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: ButtonTheme(
                      height: 40,
                      minWidth: 150,
                      child: RaisedButton(
                        color:AppConstant.primaryColor,
                        child: Text("WITHDRAW CASH"),
                        onPressed: () {
                          leader(amoount.text, Money.text, Name.text);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),),
                    ),
                  ),
                  Container(
                    height: 40,width: 150,
                    child: CustomButton(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>WithdrawHistory()));
                      },
                      text: ' HISTORY ',
                      textColor: AppConstant.titlecolor,
                      btnColor: Colors.transparent,
                      border: Border.all(
                        color: AppConstant.titlecolor,
                        width: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                child: CustomButton(
                  onTap: ()
                  async {
                    var whatsapp = "+917988498648";
                    var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=hi\nbhai ji mere account me ₹500 dal dijiye");
                    if (await canLaunchUrl(whatsappAndroid)) {
                      await launchUrl(whatsappAndroid);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("WhatsApp is not installed on the device"),
                        ),
                      );
                    }
                  },
                  text: 'Withdraw cash via whatsapp ',
                  textColor: AppConstant.titlecolor,
                  btnColor: Colors.transparent,
                  border: Border.all(
                    color: AppConstant.titlecolor,
                    width: 2,
                  ),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
