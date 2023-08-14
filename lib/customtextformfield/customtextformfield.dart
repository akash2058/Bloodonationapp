// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class Customtextform extends StatelessWidget {
  String text;
  bool? obstruct;
  Widget? widget;
  Widget? icon;
  TextEditingController controller;

  Customtextform({
    Key? key,
    required this.text,
    this.icon,
    this.obstruct,
    this.widget,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
