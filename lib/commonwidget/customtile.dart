// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customtile extends StatelessWidget {
  String title;
  String? subtitle;
  VoidCallback? ontap;
  Widget? leading;
  Widget? trailing;
  Customtile({
    Key? key,
    required this.title,
    this.ontap,
    this.leading,
    this.trailing,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: ListTile(
          trailing: trailing,
          leading: leading,
          onTap: ontap,
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle!) : null,
        ),
      ),
    );
  }
}
