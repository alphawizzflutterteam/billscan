import 'package:billscan/Helper/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String? hintt;
  String? validation;
  int maxleanthh;
  final IconData? icon;

  CustomTextField(
      {Key? key,
      this.validation,
      required this.controller,
      this.hintt,
      required this.maxleanthh,
      this.icon})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxleanthh,
      controller: widget.controller,
      cursorColor: AppColors.gray,
      style: const TextStyle(color: AppColors.gray),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: AppColors.gray,
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5)),
        hintText: widget.hintt,
        suffixStyle: const TextStyle(color: AppColors.gray),
        counterText: '',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validation;
        }
        return null;
      },
    );
  }
}
