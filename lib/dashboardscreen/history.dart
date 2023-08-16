import 'package:blooddonarapp/utilities/colors.dart';
import 'package:blooddonarapp/view/historytabs/mydonations.dart';
import 'package:blooddonarapp/view/historytabs/recentdonations.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donation History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text('Check your last donations by people on Blood Donation App'),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: TabBar(
                  indicatorColor: Appcolors.primaryred,
                  unselectedLabelColor: Appcolors.primaryblack,
                  labelColor: Appcolors.primaryred,
                  tabs: [
                    Tab(
                      text: 'Recent Donations',
                    ),
                    Tab(
                      text: 'My Donations',
                    ),
                  ]),
            ),
            Expanded(
                child: TabBarView(
                    children: [RecentDonationstab(), MyDonationtab()]))
          ],
        ),
      ),
    );
  }
}
