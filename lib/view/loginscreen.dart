import 'package:blooddonarapp/custombutton/custombutton.dart';
import 'package:blooddonarapp/customtextformfield/customtextformfield.dart';
import 'package:blooddonarapp/dashboard.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:blooddonarapp/view/signupscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidepassword = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blood Donation App',
          style: TextStyle(
              color: Appcolors.primaryblack, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Customtextform(
                widget: const Icon(Icons.email),
                text: 'Email/PhoneNumber',
                controller: emailcontroller),
            const SizedBox(
              height: 20,
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
                widget: const Icon(Icons.lock),
                obstruct: hidepassword,
                text: 'Password',
                controller: passwordcontroller),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'ForgotPassword?',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                backgroundcolor: Appcolors.primaryred,
                text: 'Login',
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                }),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Appcolors.primaryred),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                backgroundcolor: Appcolors.primaryhex,
                text: 'Emergency',
                textcolor: Appcolors.primaryred,
                onpressed: () {})
          ],
        ),
      ),
    );
  }
}
