import 'package:blooddonarapp/commonwidget/customtile.dart';
import 'package:blooddonarapp/model/donarmodel.dart';
import 'package:blooddonarapp/providers/auth.dart';
import 'package:blooddonarapp/view/historytabs/bloodonarprofile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentDonationstab extends StatelessWidget {
  const RecentDonationstab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: auth.donars.length,
            itemBuilder: (context, index) {
              var donar = auth.donars[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Customtile(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DonarProfile(
                                  donarname: donar.name,
                                  address: donar.address,
                                  phonenumber: donar.phonenumber,
                                  email: donar.email,
                                  age: donar.age,
                                  gender: donar.gender,
                                  bloodgroup: donar.bloodgroup,
                                )));
                  },
                  leading: const Icon(Icons.person),
                  title: donar.name,
                  subtitle: donar.bloodgroup,
                ),
              );
            });
      },
    );
  }
}
