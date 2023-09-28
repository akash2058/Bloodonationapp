import 'package:blooddonarapp/utilities/colors.dart';
import 'package:blooddonarapp/utilities/icons.dart';
import 'package:blooddonarapp/view/loginscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  Future<void> _navigateToMainScreen() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Set the duration you want
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Blood Donation App',
                style: TextStyle(fontSize: 25, color: Appcolors.primaryred),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                color: Appcolors.primaryred,
              )
            ],
          ),
        ),
      ),
    );
  }
}
