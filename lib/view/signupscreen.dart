import 'package:blooddonarapp/commonwidget/custombutton.dart';
import 'package:blooddonarapp/commonwidget/validation.dart';
import 'package:blooddonarapp/commonwidget/customtextformfield.dart';
import 'package:blooddonarapp/providers/auth.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:blooddonarapp/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conformpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: auth.registerformkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Create AN Account',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Customtextform(
                        validator: (value) {
                          if (isFieldEmpty(value!)) {
                            return 'Required';
                          }
                        },
                        widget: const Icon(Icons.person),
                        text: 'Username',
                        controller: auth.namecontroller),
                    const SizedBox(
                      height: 25,
                    ),
                    Customtextform(
                        validator: (value) {
                          if (isFieldEmpty(value!)) {
                            return 'Required';
                          }
                          return null;
                        },
                        widget: const Icon(Icons.email),
                        text: 'Email',
                        controller: auth.emailcontroller),
                    const SizedBox(
                      height: 25,
                    ),
                    Customtextform(
                        validator: (value) {
                          if (isFieldEmpty(value!)) {
                            return 'Required';
                          }
                          return null;
                        },
                        widget: const Icon(Icons.phone),
                        text: 'Phone',
                        controller: auth.phonenumbercontroller),
                    const SizedBox(
                      height: 25,
                    ),
                    Customtextform(
                        validator: (value) {
                          if (isFieldEmpty(value!)) {
                            return 'Required';
                          }
                        },
                        icon: IconButton(
                            onPressed: () {
                              auth.hidepasswords();
                            },
                            icon: auth.hidepassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        widget: const Icon(Icons.lock),
                        obstruct: auth.hidepassword,
                        text: 'Password',
                        controller: auth.passwordcontroller),
                    const SizedBox(
                      height: 25,
                    ),
                    auth.loadingregister == true
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            backgroundcolor: Appcolors.primaryred,
                            text: 'Continue',
                            onpressed: () {
                              if (auth.registerformkey.currentState!
                                  .validate()) {
                                auth
                                    .registerWithUsernamePhoneAndPassword(
                                        auth.namecontroller.text,
                                        auth.emailcontroller.text,
                                        auth.phonenumbercontroller.text,
                                        auth.passwordcontroller.text)
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Register Successfully !!!')));
                                });
                              }
                            }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          'Back To Login',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.primaryred),
                        )),
                    const Text('Click Continue for Sign Up Your Account !!!'),
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
