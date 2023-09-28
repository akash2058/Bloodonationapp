// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customtextform extends StatelessWidget {
  String text;
  VoidCallback? ontap;
  TextInputType? keyboardtype;
  bool? obstruct;
  String? Function(String?)? validator;
  Widget? widget;
  Widget? icon;
  TextEditingController controller;

  Customtextform({
    Key? key,
    required this.text,
    this.ontap,
    this.keyboardtype,
    this.validator,
    this.icon,
    this.obstruct,
    this.widget,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      keyboardType: keyboardtype,
      validator: validator,
      obscureText: obstruct ?? false,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: icon,
          prefixIcon: widget,
          labelText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
