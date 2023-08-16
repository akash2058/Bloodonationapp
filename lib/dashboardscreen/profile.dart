import 'package:flutter/material.dart';

import '../customtile/customtile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
            ),
            const Text('Shyam Karki'),
            const Text('shyam@gmail.com'),
            Customtile(title: 'Ram Karki', subtitle: 'Address'),
            Customtile(title: 'Shyam karki', subtitle: 'Address'),
            Customtile(title: 'Ram Karki', subtitle: 'Address'),
            Customtile(title: 'Ram Karki', subtitle: 'Address'),
            Customtile(title: 'Ram Karki', subtitle: 'Address'),
          ],
        ),
      ),
    );
  }
}
