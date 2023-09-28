import 'package:blooddonarapp/providers/auth.dart';
import 'package:blooddonarapp/view/historytabs/bloodonarprofile.dart';
import 'package:blooddonarapp/view/requestprofile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../commonwidget/customtile.dart';

class MyDonationtab extends StatelessWidget {
  const MyDonationtab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return ListView.builder(
            itemCount: auth.requestlist.length,
            shrinkWrap: true,
            reverse: false,
            itemBuilder: (context, index) {
              var state = auth.requestlist[index];
              return Customtile(
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestProfile(
                                location: state.location,
                                patientname: state.name,
                                date: state.date,
                                time: state.time,
                                gender: state.gender,
                                relation: state.relation,
                                bloodgroup: state.bloodgroup,
                              )));
                },
                leading: const Icon(Icons.person),
                title: state.name,
                subtitle: state.phonenumber,
              );
            });
      },
    );
  }
}
