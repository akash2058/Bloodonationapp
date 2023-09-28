import 'package:blooddonarapp/utilities/colors.dart';
import 'package:blooddonarapp/view/historytabs/requestforblood.dart';
import 'package:blooddonarapp/view/historytabs/recentdonations.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Donation History',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Text('List of Donations and Request for Blood'),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(),
                  child: const TabBar(
                      indicatorColor: Appcolors.primaryred,
                      unselectedLabelColor: Appcolors.primaryblack,
                      labelColor: Appcolors.primaryred,
                      tabs: [
                        Tab(
                          text: 'Donations',
                        ),
                        Tab(
                          text: 'Request for Blood',
                        ),
                      ]),
                ),
                const Expanded(
                    child: TabBarView(
                        children: [RecentDonationstab(), MyDonationtab()]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
