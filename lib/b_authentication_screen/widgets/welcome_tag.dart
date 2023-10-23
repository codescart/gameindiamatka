import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeTag extends StatefulWidget {
  const WelcomeTag({Key? key}) : super(key: key);

  @override
  State<WelcomeTag> createState() => _WelcomeTagState();
}

class _WelcomeTagState extends State<WelcomeTag> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Container(
          height: 250,
          child: Image(image:AssetImage("assets/images/dmatka1.png") ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Welcome to ',
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          'India Matka',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }
}
