import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/otp_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_textformfield.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/welcome_tag.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/_main_dashboard_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/pklogon.dart';

import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible =false;


  @override
  Widget build(BuildContext context) {
    final userEmail = TextEditingController();
    final userPassword = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    controller: userEmail,
                    hintText: 'E-Mail Address',
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    isPassword: false,
                    validator: () {
                      if (userEmail.text.isEmpty) {
                        return "E-Mail cannot be empty";
                      }
                      if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-zA-Z0-9+_.-]+.[a-z]")
                          .hasMatch(userEmail.text)) {
                        return "Please enter a valid E-Mail";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    controller: userPassword,
                    hintText: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    isPassword: isPasswordVisible,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isPasswordVisible = !isPasswordVisible ==true;
                      },
                      child: Icon(
                        isPasswordVisible ==true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppConstant.titlecolor,
                      ),
                    ),
                    validator: () {
                      if (userPassword.text.isEmpty) {
                        return "Password cannot be empty";
                      } else if (userPassword.text.length < 6) {
                        return "Password length should be atleast 6";
                      }

                      return null;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: AppConstant.titlecolor,
                  ),
                  child: const Text('Forgot Pasword?'),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: 'LOGIN',
                      onTap: () {login(userEmail.text,userPassword.text,);},
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: 'LOGIN WITH OTP',
                      textColor: AppConstant.titlecolor,
                      btnColor: Colors.transparent,
                      border: Border.all(
                        color: AppConstant.titlecolor,
                        width: 2,
                      ),
                      onTap: () {

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>  OTPScreen(),
                          ),
                        );
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

  login(String userEmail, String userPassword,)async {
    final response = await http.post(
      Uri.parse(
          Apiconst.baseurl+"userlogin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email":userEmail,
        "password":userPassword,
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {
      final otp=data['otp'];
      final prefs1 = await SharedPreferences.getInstance();
      final key1 = 'user_id';
      final mobile = data['data']['id'] ;
      prefs1.setString(key1, mobile);

      Fluttertoast.showToast(
          msg: "Email login SucessFully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Email login SucessFully");
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainDashboardScreen()));
    } else {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
