import 'package:blooddonarapp/commonwidget/custombutton.dart';
import 'package:blooddonarapp/commonwidget/customtextformfield.dart';
import 'package:blooddonarapp/commonwidget/customtile.dart';
import 'package:blooddonarapp/providers/auth.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindDonarsScreen extends StatefulWidget {
  const FindDonarsScreen({super.key});

  @override
  State<FindDonarsScreen> createState() => _FindDonarsScreenState();
}

class _FindDonarsScreenState extends State<FindDonarsScreen> {
  List<bool> selectedStates = [true, false, false, false, false, false];
  List<String> text = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Donate For Blood',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Fill in the Form for donation',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            text.length,
                            (index) => SizedBox(
                              height: 50,
                              width: 50,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    for (int i = 0;
                                        i < selectedStates.length;
                                        i++) {
                                      selectedStates[i] = (i == index);
                                      auth.bloodgroupcontroller.text =
                                          text[index];
                                      print(
                                          'controller${auth.bloodgroupcontroller.text}');
                                    }
                                  });
                                },
                                child: Card(
                                  color: selectedStates[index]
                                      ? Colors.red
                                      : Colors.white,
                                  child: Center(
                                    child: Text(
                                      text[index],
                                      style: TextStyle(
                                          color: selectedStates[index]
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Full Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Customtextform(
                      text: 'Enter Your Name', controller: auth.namecontroller),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Customtextform(
                      text: 'Enter Your Address',
                      controller: auth.addresscontroller),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Customtextform(
                      text: 'Enter Your Email',
                      controller: auth.emailcontroller),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Age',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Customtextform(
                      keyboardtype: TextInputType.number,
                      text: 'Your age ',
                      controller: auth.agecontroller),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Gender',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Customtextform(
                      ontap: () {
                        setState(() {
                          auth.isdropdown = true;
                        });
                      },
                      text: 'enter your gender',
                      controller: auth.gendercontroller),
                  const SizedBox(
                    height: 15,
                  ),
                  if (auth.isdropdown)
                    Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        children: List.generate(
                            auth.gender.length,
                            (index) => Customtile(
                                ontap: () {
                                  setState(() {
                                    auth.isdropdown = false;
                                    auth.gendercontroller.text =
                                        auth.gender[index];
                                  });
                                },
                                title: auth.gender[index])),
                      ),
                    ),
                  const Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Customtextform(
                      keyboardtype: TextInputType.number,
                      text: 'enter your phone number',
                      controller: auth.phonenumbercontroller),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                      backgroundcolor: Appcolors.primaryred,
                      text: 'Click for Donation',
                      onpressed: () {
                        auth.addUserInformation(
                            auth.namecontroller.text,
                            auth.addresscontroller.text,
                            auth.emailcontroller.text,
                            auth.agecontroller.text,
                            auth.gendercontroller.text,
                            auth.phonenumbercontroller.text,
                            auth.bloodgroupcontroller.text,
                            context);
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
