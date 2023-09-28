import 'package:blooddonarapp/providers/auth.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:blooddonarapp/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commonwidget/customtile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, pro, child) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Customtile(title: 'Email', subtitle: pro.user!.email),
                      Customtile(title: 'Address', subtitle: 'address'),
                      Customtile(
                          title: 'Contact Number',
                          subtitle: pro.user!.phonenumber),
                      Customtile(title: 'Blood Group', subtitle: 'A+'),
                      Customtile(title: 'Gender', subtitle: 'male'),
                      Customtile(
                          ontap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                (route) => true);
                          },
                          title: 'Logout',
                          subtitle: 'Click for Logout'),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolors.primaryred),
                        child: const Center(
                          child: Text(
                            'Blood Donation App',
                            style: TextStyle(
                                color: Appcolors.primarywhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
