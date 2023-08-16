import 'package:blooddonarapp/custombutton/custombutton.dart';
import 'package:blooddonarapp/customtextformfield/customtextformfield.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';

class FindDonarsScreen extends StatefulWidget {
  const FindDonarsScreen({super.key});

  @override
  State<FindDonarsScreen> createState() => _FindDonarsScreenState();
}

class _FindDonarsScreenState extends State<FindDonarsScreen> {
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
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find Donor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Search for donors around you',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Customtextform(
                text: 'Enter Your Location', controller: locationcontroller),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                backgroundcolor: Appcolors.primaryred,
                text: 'Search Donar',
                onpressed: () {}),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                backgroundcolor: Appcolors.primaryhex,
                text: 'Emergency',
                textcolor: Appcolors.primaryred,
                onpressed: () {}),
            const SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
