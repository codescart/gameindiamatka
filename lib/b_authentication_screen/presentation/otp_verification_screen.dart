import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/signup_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/_main_dashboard_screen.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';

class OTPVerification extends StatefulWidget {
   final String otp;
  final String mobile;

  const OTPVerification({Key? key, required this.otp, required this.mobile}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final otpvef = TextEditingController();
  int _counter = 50;
  late Timer _timer;

  _startTimer() {
    _counter = 50; //time counter
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }





  otpvalid(String otpvef) {
    print(otpvef+"  lsddddddddd");
    print(widget.otp+"  contr");

    widget.otp == otpvef ?
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MainDashboardScreen()))
    //
    // Fluttertoast.showToast(
    //     msg: "Login Successfully",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0)
    :
    Fluttertoast.showToast(
    msg: "Wrong Otp",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0);



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Verification'+widget.otp,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'otp has sended to +91'+widget.mobile,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                'Didn\'t you receive any code?',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10.0,left: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: otpvef,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        ),
                      ),

                      labelText: 'Verify OTP',
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'RESEND NEW CODE',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppConstant.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              CustomButton(
                text: 'Verify OTP',
                onTap: () {
                  otpvalid(otpvef.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
