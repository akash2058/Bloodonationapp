import 'package:blooddonarapp/commonwidget/custombutton.dart';
import 'package:blooddonarapp/commonwidget/customtextformfield.dart';
import 'package:blooddonarapp/commonwidget/customtile.dart';
import 'package:blooddonarapp/providers/auth.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
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
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Request For Blood',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Request for Blood Whenever you need'),
                    const SizedBox(
                      height: 15,
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
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Customtextform(
                        text: 'Enter your location',
                        controller: auth.locationcontroller),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Customtextform(
                        ontap: () {
                          selectDate(context);
                        },
                        text: 'choose date',
                        controller: auth.datecontroller),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Time',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Customtextform(
                        ontap: () {
                          selectTime(context);
                        },
                        text: 'choose time',
                        controller: auth.timecontroller),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Patient Name',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Customtextform(
                        text: 'Choose', controller: auth.namecontroller),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Customtextform(
                        keyboardtype: TextInputType.number,
                        text: 'phone number',
                        controller: auth.phonenumbercontroller),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Relation',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Customtextform(
                        ontap: () {
                          setState(() {
                            auth.isdropdown = true;
                          });
                        },
                        text: 'choose relation',
                        controller: auth.relationcontroller),
                    if (auth.isdropdown)
                      Container(
                        decoration: const BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                                auth.relations.length,
                                (index) => Customtile(
                                    ontap: () {
                                      setState(() {
                                        auth.isdropdown = false;
                                        auth.relationcontroller.text =
                                            auth.relations[index];
                                      });
                                    },
                                    title: auth.relations[index])),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Customtextform(
                        ontap: () {
                          setState(() {
                            auth.isdropdown = true;
                          });
                        },
                        text: 'choose relation',
                        controller: auth.gendercontroller),
                    if (auth.isdropdown)
                      Container(
                        decoration: const BoxDecoration(),
                        child: SingleChildScrollView(
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
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        backgroundcolor: Appcolors.primaryred,
                        text: 'Request for blood',
                        onpressed: () {
                          auth.addRequestforblood(
                              auth.locationcontroller.text,
                              auth.datecontroller.text,
                              auth.timecontroller.text,
                              auth.namecontroller.text,
                              auth.gendercontroller.text,
                              auth.phonenumbercontroller.text,
                              auth.bloodgroupcontroller.text,
                              context);
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<void> selectDate(BuildContext context) async {
  var state = Provider.of<AuthProvider>(context,
      listen:
          false); // Use listen: false if you don't need to listen for changes
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
  if (picked != null) {
    state.datecontroller.text = DateFormat('yyyy-MM-dd').format(picked);
  }
}

Future<void> selectTime(BuildContext context) async {
  var state = Provider.of<AuthProvider>(context,
      listen:
          false); // Use listen: false if you don't need to listen for changes
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    state.timecontroller.text = picked.format(context);
  }
}
