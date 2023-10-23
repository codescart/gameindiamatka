import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/otp_verification_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/signup_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_textformfield.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/welcome_tag.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/pklogon.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {


  @override
  Widget build(BuildContext context) {
    final userCountryCode = TextEditingController(
      text: '+91',
    );
    final userMobileNo = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Mobile'),
         leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const Center(
                  child: WelcomeTag(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Mobile Number',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: SizedBox(
                          width: 35.w,
                          child: CustomTextFormField(
                            controller: userCountryCode,
                            hintText: '+91',
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            isPassword: false,
                            validator: () {
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: SizedBox(
                          width: 270.w,
                          child: CustomTextFormField(
                            controller: userMobileNo,
                            hintText: '0000000000',
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            isPassword: false,
                            validator: () {
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: 'NEXT',
                      onTap: () {otp(userMobileNo.text);

                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) =>  OTPScreens(phone: userMobileNo.text),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  otp(String userMobileNo,)async {
    final response = await http.post(
      Uri.parse(
          Apiconst.baseurl+"user_login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "mobile":userMobileNo,

      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == '200') {

      final mobile = data['id']['id'];
      final otp = data['otp'];

      Fluttertoast.showToast(
          msg: "Send Otp SucessFully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // print("Send Otp SucessFully");
      Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreens(phone:userMobileNo, id:mobile,otp:otp)));
    } else {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupScreen()));
    }
  }
}
