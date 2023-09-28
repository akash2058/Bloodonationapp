// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:blooddonarapp/commonwidget/customtile.dart';

// ignore: must_be_immutable
class DonarProfile extends StatelessWidget {
  String donarname;
  String bloodgroup;
  String address;
  String phonenumber;
  String email;
  String age;
  String gender;
  DonarProfile({
    Key? key,
    required this.donarname,
    required this.bloodgroup,
    required this.address,
    required this.phonenumber,
    required this.email,
    required this.age,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(donarname, style: const TextStyle(fontSize: 20)),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 15,
                ),
                Text(bloodgroup, style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Customtile(subtitle: email, title: 'Email'),
          const SizedBox(
            height: 15,
          ),
          Customtile(
            title: 'Age',
            subtitle: age,
          ),
          const SizedBox(
            height: 15,
          ),
          Customtile(subtitle: address, title: 'Address'),
          const SizedBox(
            height: 15,
          ),
          Customtile(
            title: 'Gender',
            subtitle: gender,
          ),
          const SizedBox(
            height: 15,
          ),
          Customtile(
            title: 'Phone Number',
            subtitle: bloodgroup,
          ),
        ],
      ),
    );
  }
}
