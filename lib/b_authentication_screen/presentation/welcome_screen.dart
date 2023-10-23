import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/login_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/otp_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/signup_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset("assets/images/dmatka1.png"),
            // FlutterLogo(
            //   size: 150.sp,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomButton(
                    text: 'Login with Phone',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: AppConstant.primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
