import 'package:blooddonarapp/commonwidget/customtile.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class DonationProfile extends StatelessWidget {
  const DonationProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_backspace)),
        centerTitle: true,
        title: const Text('Donation Profile'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, pro, child) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Colors.blue.shade400,
                                Colors.blueAccent
                              ])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 25,
                                child: Icon(Icons.person),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Username: ${pro.user?.username ?? ''}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Customtile(title: 'Email', subtitle: 'email'),
                        Customtile(title: 'Address', subtitle: 'address'),
                        Customtile(
                            title: 'Contact Number',
                            subtitle: 'contact Number'),
                        Customtile(title: 'Blood Group', subtitle: 'A+'),
                        Customtile(title: 'Gender', subtitle: 'male'),
                        Customtile(
                            title: 'Logout', subtitle: 'Click for Logout'),
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
      ),
    );
  }
}
