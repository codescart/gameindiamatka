import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.btnColor = AppConstant.primaryColor,
    this.textColor = AppConstant.backgroundColor,
    this.border,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final Color? btnColor;
  final Color? textColor;
  final BoxBorder? border;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

    @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Ink(
        child: Container(
          width: width,
          height: 35.h,
          decoration: BoxDecoration(
            color: widget.btnColor,
            borderRadius: BorderRadius.circular(
              12.sp,
            ),
            border: widget.border,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: widget.textColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.25,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
