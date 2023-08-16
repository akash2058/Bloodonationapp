import 'package:blooddonarapp/custombutton/custombutton.dart';
import 'package:blooddonarapp/customtextformfield/customtextformfield.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  TextEditingController locationcontroller = TextEditingController();
  List<bool> selectedStates = [true, false, false, false, false];
  List<String> text = [
    'A+',
    'A-',
    'B',
    'O+',
    'O-',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Request For Blood',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Request for Blood Whenever you need'),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    text.length,
                    (index) => SizedBox(
                      height: 50,
                      width: 50,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            for (int i = 0; i < selectedStates.length; i++) {
                              selectedStates[i] = (i == index);
                            }
                          });
                        },
                        child: Card(
                          color:
                              selectedStates[index] ? Colors.red : Colors.white,
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
                  text: 'Enter your location', controller: locationcontroller),
              SizedBox(
                height: 15,
              ),
              Text(
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
                  text: 'choose date', controller: locationcontroller),
              const SizedBox(
                height: 15,
              ),
              Text(
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
                  text: 'choose time', controller: locationcontroller),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Blood Unit',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Customtextform(
                  text: 'choose blood unit ', controller: locationcontroller),
              SizedBox(
                height: 15,
              ),
              Text(
                'Patient',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Customtextform(
                  text: 'choose blood unit ', controller: locationcontroller),
              SizedBox(
                height: 15,
              ),
              Text(
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
                  text: 'choose relation', controller: locationcontroller),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                  backgroundcolor: Appcolors.primaryred,
                  text: 'Request for blood',
                  onpressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green[500],
                        content: Text('Blood Requested Successfully')));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
