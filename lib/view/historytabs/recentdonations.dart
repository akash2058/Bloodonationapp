import 'package:blooddonarapp/customtile/customtile.dart';
import 'package:flutter/material.dart';

class RecentDonationstab extends StatelessWidget {
  const RecentDonationstab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customtile(title: 'Ram Karki', subtitle: 'Address'),
        Customtile(title: 'Shyam karki', subtitle: 'Address'),
        Customtile(title: 'Ram Karki', subtitle: 'Address'),
        Customtile(title: 'Ram Karki', subtitle: 'Address'),
        Customtile(title: 'Ram Karki', subtitle: 'Address'),
      ],
    );
  }
}
