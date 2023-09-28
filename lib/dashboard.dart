import 'package:blooddonarapp/commonwidget/customtile.dart';
import 'package:blooddonarapp/dashboardscreen/donation.dart';
import 'package:blooddonarapp/dashboardscreen/history.dart';
import 'package:blooddonarapp/dashboardscreen/profile.dart';
import 'package:blooddonarapp/dashboardscreen/request.dart';
import 'package:blooddonarapp/providers/auth.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:blooddonarapp/utilities/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentab = 0;
  List<Widget> screens = [
    const FindDonarsScreen(),
    const RequestScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) => Scaffold(
        appBar: AppBar(
          leading: const Image(image: AssetImage(Appicons.blood)),
          backgroundColor: Colors.white,
          title: Customtile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: 'Hi ${auth.user!.username}!',
              subtitle: 'Welcome to Blood Donation App'),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 70,
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentab = 0;
                        });
                      },
                      child: Icon(
                        CupertinoIcons.home,
                        color: currentab == 0
                            ? Appcolors.primaryred
                            : Appcolors.primaryblack,
                      ),
                    ),
                    Text(
                      'Donate',
                      style: TextStyle(
                          color: currentab == 0
                              ? Appcolors.primaryred
                              : Appcolors.primaryblack),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentab = 1;
                        });
                      },
                      child: Icon(
                        CupertinoIcons.app_badge_fill,
                        color: currentab == 1
                            ? Appcolors.primaryred
                            : Appcolors.primaryblack,
                      ),
                    ),
                    Text(
                      'Request',
                      style: TextStyle(
                          color: currentab == 1 ? Appcolors.primaryred : null),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentab = 2;
                        });
                      },
                      child: Icon(
                        CupertinoIcons.clock,
                        color: currentab == 2
                            ? Appcolors.primaryred
                            : Appcolors.primaryblack,
                      ),
                    ),
                    Text(
                      'History',
                      style: TextStyle(
                          color: currentab == 2 ? Appcolors.primaryred : null),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentab = 3;
                        });
                      },
                      child: Icon(
                        CupertinoIcons.person,
                        color: currentab == 3
                            ? Appcolors.primaryred
                            : Appcolors.primaryblack,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: currentab == 3 ? Appcolors.primaryred : null),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: screens[currentab],
      ),
    );
  }
}
