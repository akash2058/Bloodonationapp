// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:blooddonarapp/commonwidget/customtile.dart';

// ignore: must_be_immutable
class RequestProfile extends StatelessWidget {
  String location;
  String patientname;
  String date;
  String time;
  String relation;
  String gender;
  String bloodgroup;
  RequestProfile({
    Key? key,
    required this.location,
    required this.patientname,
    required this.date,
    required this.time,
    required this.relation,
    required this.gender,
    required this.bloodgroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue[500],
                      radius: 40,
                      child: const Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(patientname, style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      bloodgroup,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Customtile(
              title: 'Location',
              subtitle: location,
            ),
            const SizedBox(
              height: 15,
            ),
            Customtile(
              title: 'Time',
              subtitle: time,
            ),
            const SizedBox(
              height: 15,
            ),
            Customtile(
              title: 'Date',
              subtitle: date,
            ),
            const SizedBox(
              height: 15,
            ),
            Customtile(
              title: 'Gender',
              subtitle: gender,
            ),
          ],
        ),
      ),
    );
  }
}
