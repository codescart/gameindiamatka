import 'package:flutter/material.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppConstant.secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.keyboard_arrow_left_rounded,
          ),
        ),
      ),
    );
  }
}
