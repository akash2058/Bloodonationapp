// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:blooddonarapp/utilities/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  Color? textcolor;
  Color? backgroundcolor;
  VoidCallback onpressed;
  CustomButton(
      {Key? key,
      required this.text,
      this.backgroundcolor,
      required this.onpressed,
      this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: backgroundcolor),
          onPressed: onpressed,
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          )),
    );
  }
}
