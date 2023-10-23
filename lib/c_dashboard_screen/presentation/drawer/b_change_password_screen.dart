import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_textformfield.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final password = TextEditingController();
    final newPassword = TextEditingController();
    final cofirmPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Create a New Password',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'our new password must be different from\nprevious new passwords.',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: AppConstant.subtitlecolor,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextFormField(
              controller: password,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.visiblePassword,
              hintText: 'Password',
              isPassword: isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible == true;
                },
                child: Icon(
                  isPasswordVisible == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppConstant.subtitlecolor,
                ),
              ),
              validator: () {},
            ),
            CustomTextFormField(
              controller: newPassword,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              hintText: 'New Password',
              isPassword: isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible == true;
                },
                child: Icon(
                  isPasswordVisible == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppConstant.subtitlecolor,
                ),
              ),
              validator: () {},
            ),
            CustomTextFormField(
              controller: cofirmPassword,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              hintText: 'Confirm Password',
              isPassword: isPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible == true;
                },
                child: Icon(
                  isPasswordVisible == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppConstant.subtitlecolor,
                ),
              ),
              validator: () {},
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              onTap: () {
                 reset(password.text, newPassword.text,cofirmPassword.text);
              },
              text: 'RESET PASSWORD',
            ),
          ],
        ),
      ),
    );
  }
  reset(String password, String newPassword,String cofirmPassword)
  async {
    final prefs = await SharedPreferences.getInstance();
    final key1 = 'user_id';
    final value = prefs.getString(key1) ?? 0;
  final response = await http.post(
  Uri.parse(
  Apiconst.baseurl+"changepassword"),
  headers: <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
  },
  body: jsonEncode(<String, String>{
    "id":"$value",
  'old_password':password,
  "new_password":newPassword,
  "confirm_password":cofirmPassword,


  }),
  );
  final data = jsonDecode(response.body);
  print(data);
  if (data['error'] == 200) {
  final prefs1 = await SharedPreferences
      .getInstance();
  final key1 = 'user_id';
  final mobile = data['id'] ;
  prefs1.setString(key1, mobile);
  Fluttertoast.showToast(
  msg: "Register SucessFully",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  timeInSecForIosWeb: 1,
  backgroundColor: Colors.green,
  textColor: Colors.white,
  fontSize: 16.0);
  print("Register SucessFully");
  Navigator.of(context).pop();
  } else {
  Fluttertoast.showToast(
  msg: data['msg'],
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  timeInSecForIosWeb: 1,
  backgroundColor: Colors.green,
  textColor: Colors.white,
  fontSize: 16.0);
  }

  }
}



