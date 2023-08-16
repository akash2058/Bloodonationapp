import 'package:flutter/material.dart';

import '../../customtile/customtile.dart';

class MyDonationtab extends StatelessWidget {
  const MyDonationtab({super.key});

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
