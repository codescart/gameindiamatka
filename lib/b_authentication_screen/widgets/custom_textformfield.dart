import 'package:flutter/material.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.textInputAction,
    required this.textInputType,
    required this.hintText,
    required this.isPassword,
    this.suffixIcon,
    this.prefix,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String hintText;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Function() validator;


  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      autofocus: false,

      obscureText: widget.isPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefix: widget.prefix,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppConstant.titlecolor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppConstant.titlecolor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppConstant.titlecolor,
          ),
        ),
        suffixIcon: widget.suffixIcon,
        hintStyle: const TextStyle(
          color: AppConstant.subtitlecolor,
        ),
        fillColor: AppConstant.titlecolor,
        iconColor: AppConstant.titlecolor,
      ),
      validator: (a) {
        return widget.validator();
      },
    );
  }
}
