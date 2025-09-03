import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customTextformfield extends StatelessWidget {
  customTextformfield({
    super.key,
    this.hintText,
    this.validator,
    required this.controller,
    this.maxlines = 1,
    this.icon,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  int maxlines;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(hintText: hintText, suffixIcon: icon),
    );
  }
}
