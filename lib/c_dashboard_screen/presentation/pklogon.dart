import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/signup_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/welcome_tag.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/_main_dashboard_screen.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'package:flutter/material.dart';


class OTPScreens extends StatefulWidget {
  final String? phone;
  final String? id;
  final String? otp;
  OTPScreens({required this.phone,required this.id, required this.otp});




  @override
  _OTPScreensState createState() => _OTPScreensState();
}

class _OTPScreensState extends State<OTPScreens> {
  int _otpCodeLength = 6;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController textEditingController = new TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _getSignatureCode();
    _startListeningSms();
  }

  @override
  void dispose() {
    super.dispose();
    SmsVerification.stopListening();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(12.0),
    );
  }

  /// get signature code
  _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    print("signature $signature");
  }

  /// listen sms
  _startListeningSms()  {
    SmsVerification.startListeningSms().then((message) {
      setState(() {
        _otpCode = SmsVerification.getCode(message, intRegex);
        textEditingController.text = _otpCode;
        _onOtpCallBack(_otpCode, true);
      });
    });
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode(_otpCode);
    });
  }

  _onClickRetry() {
    _startListeningSms();
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode(otpCode);
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode(String otpCode)async {
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(Duration(milliseconds: 4000), () async{
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

      if (otpCode == widget.otp) {
        setState(() {
          _isLoadingButton = false;
        });
        final prefs1 = await SharedPreferences
            .getInstance();
        final key1 = 'user_id';
        final mobile = widget.id ;
        prefs1.setString(key1, mobile!);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainDashboardScreen()),
                (route) => false);
      } else {
        Fluttertoast.showToast(
            msg: 'Wrong Otp',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
    }});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
              child: WelcomeTag(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                'Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp,
                    color: AppConstant.titlecolor
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 5.h),
              child: Center(
                child: Text('Enter the code send to the number',
                  style: TextStyle(color:AppConstant.titlecolor),),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 5.h),
              child: Center(
                child: Text('+91'+"${widget.phone}",
                  style: TextStyle(color:AppConstant.titlecolor),),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFieldPin(
                textController: textEditingController,
                autoFocus: true,
                codeLength: _otpCodeLength,
                alignment: MainAxisAlignment.center,
                defaultBoxSize: 40.0,
                margin: 5,
                selectedBoxSize: 40.0,
                textStyle: TextStyle(fontSize: 16),
                defaultDecoration: _pinPutDecoration.copyWith(
                    border: Border.all(
                        color: Theme.of(context)
                            .primaryColor
                            .withOpacity(0.6))),
                selectedDecoration: _pinPutDecoration,
                onChange: (code) {
                  _onOtpCallBack(code,false);
                }),
            SizedBox(
              height: 32,
            ),
            Container(
              width:  MediaQuery.of(context).size.width * 0.85,
              height: 35.h,
              child: MaterialButton(

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.sp,))),

                onPressed: _enableButton ? _onSubmitOtp : null,
                child: _setUpButtonChild(),
                color: AppConstant.primaryColor,
                disabledColor: AppConstant.subtitlecolor,
              ),
            ),
            Container(

              child: TextButton(
                onPressed: _onClickRetry,
                child: Text(
                  "Retry",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verify",
        style: Theme.of(context).textTheme.headline4!.copyWith(
          color: AppConstant.titlecolor,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.25,
        ),
      );
    }
  }
}
