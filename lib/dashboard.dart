import 'package:blooddonarapp/dashboardscreen/finddonars.dart';
import 'package:blooddonarapp/dashboardscreen/history.dart';
import 'package:blooddonarapp/dashboardscreen/profile.dart';
import 'package:blooddonarapp/dashboardscreen/request.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentab = 0;
  List<Widget> screens = [
    const FindDonarsScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
    const RequestScreen()
  ];
  bool home = true;
  bool history = true;
  bool request = true;
  bool donars = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentab = 0;
                          home = true;
                          history = false;
                          donars = false;
                          request = false;
                        });
                      },
                      child: AnimatedContainer(
                          height: home ? 30 : 20,
                          width: home ? 30 : 20,
                          duration: const Duration(milliseconds: 500),
                          child: Icon(
                            Icons.add_home_work_sharp,
                            color: currentab == 0
                                ? Appcolors.primaryred
                                : Appcolors.primaryblack,
                          )),
                    ),
                    if (home)
                      Text(
                        'Find Donars',
                        style: TextStyle(
                            color: currentab == 0
                                ? Appcolors.primaryred
                                : Appcolors.primaryblack),
                      )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentab = 1;
                          home = false;
                          history = true;
                          donars = false;
                          request = false;
                        });
                      },
                      child: AnimatedContainer(
                          height: history ? 30 : 20,
                          width: history ? 30 : 20,
                          child: Icon(
                            Icons.history,
                            color: currentab == 1
                                ? Appcolors.primaryred
                                : Appcolors.primaryblack,
                          ),
                          duration: const Duration(milliseconds: 500)),
                    ),
                    if (history)
                      Text(
                        'Request',
                        style: TextStyle(
                            color: currentab == 1
                                ? Appcolors.primaryred
                                : Appcolors.primaryblack),
                      )
                  ],
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentab = 2;
                          home = false;
                          history = false;
                          donars = true;
                          request = false;
                        });
                      },
                      child: AnimatedContainer(
                          height: donars ? 30 : 20,
                          width: donars ? 30 : 20,
                          duration: const Duration(milliseconds: 500),
                          child: Icon(
                            Icons.book_rounded,
                            color: currentab == 2
                                ? Appcolors.primaryred
                                : Appcolors.primaryblack,
                          )),
                    ),
                    if (donars)
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: currentab == 0
                                ? Appcolors.primaryred
                                : Appcolors.primaryblack),
                      )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentab = 3;
                          home = false;
                          history = false;
                          donars = false;
                          request = true;
                        });
                      },
                      child: AnimatedContainer(
                          height: request ? 30 : 20,
                          width: request ? 30 : 20,
                          child: Icon(
                            Icons.person,
                            color: currentab == 3
                                ? Appcolors.primaryred
                                : Appcolors.primaryblack,
                          ),
                          duration: const Duration(milliseconds: 500)),
                    ),
                    if (request)
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: currentab == 3
                                ? Appcolors.primaryred
                                : Appcolors.primaryblack),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens[currentab],
    );
  }
}
