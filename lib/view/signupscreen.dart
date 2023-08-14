import 'package:blooddonarapp/custombutton/custombutton.dart';
import 'package:blooddonarapp/customtextformfield/customtextformfield.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidepassword = true;
  bool hideconformpassword = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conformpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            const Text(
              'Create AN Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Customtextform(
                widget: Icon(Icons.email),
                text: 'Email/PhoneNumnber',
                controller: emailcontroller),
            SizedBox(
              height: 25,
            ),
            Customtextform(
                icon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidepassword = !hidepassword;
                      });
                    },
                    icon: hidepassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility)),
                widget: Icon(Icons.lock),
                obstruct: hidepassword,
                text: 'Password',
                controller: passwordcontroller),
            SizedBox(
              height: 25,
            ),
            Customtextform(
                icon: IconButton(
                    onPressed: () {
                      setState(() {
                        hideconformpassword = !hideconformpassword;
                      });
                    },
                    icon: hideconformpassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility)),
                widget: Icon(Icons.lock),
                obstruct: hideconformpassword,
                text: 'ConfirmPassword',
                controller: conformpasswordcontroller),
            SizedBox(
              height: 25,
            ),
            CustomButton(
                backgroundcolor: Appcolors.primaryred,
                text: 'Continue',
                onpressed: () {}),
            SizedBox(
              height: 20,
            ),
            Text('Click Continue for Sign Up Your Account !!!'),
          ],
        ),
      ),
    );
  }
}
