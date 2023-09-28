import 'package:blooddonarapp/commonwidget/custombutton.dart';
import 'package:blooddonarapp/commonwidget/validation.dart';
import 'package:blooddonarapp/commonwidget/customtextformfield.dart';
import 'package:blooddonarapp/dashboard.dart';
import 'package:blooddonarapp/providers/auth.dart';
import 'package:blooddonarapp/utilities/colors.dart';
import 'package:blooddonarapp/utilities/icons.dart';
import 'package:blooddonarapp/view/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
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
            child: Form(
              key: auth.loginformkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                      alignment: Alignment.center,
                      child: Image(image: AssetImage(Appicons.blood))),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Customtextform(
                      validator: (value) {
                        if (!isEmailValid(value!)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                      widget: const Icon(Icons.email),
                      text: 'Email/PhoneNumber',
                      controller: auth.emailcontroller),
                  const SizedBox(
                    height: 20,
                  ),
                  Customtextform(
                      validator: (value) {
                        if (!isPasswordValid(value!)) {
                          return 'invalid password';
                        }
                        return null;
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
                    height: 30,
                  ),
                  auth.loading == true
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          backgroundcolor: Appcolors.primaryred,
                          text: 'Login',
                          onpressed: () {
                            if (auth.loginformkey.currentState!.validate()) {
                              auth.signIn(context);
                            }
                          }),
                  const SizedBox(
                    height: 15,
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
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Appcolors.primaryred),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
