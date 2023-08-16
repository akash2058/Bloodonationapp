// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';

class Customtile extends StatelessWidget {
  String title;
  String subtitle;
  Customtile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: ListTile(
          leading: Icon(
            Icons.circle,
            color: Appcolors.primaryred,
          ),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
