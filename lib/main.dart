import 'package:blooddonarapp/providers/auth.dart';

import 'package:blooddonarapp/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBW_kG-sZXSJ5zE70tK01HSGPDni6RNDm0",
        appId: "1:830421188636:android:73c21d5935c57e5a70dfd9",
        messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
        projectId: "bloodonarapp",
        // Add other required options here
      ),
    );
    runApp(
      ChangeNotifierProvider<AuthProvider>(
        lazy: false,
        create: (context) =>
            AuthProvider(), // Instantiate your ChangeNotifier subclass here
        child: const MyApp(),
      ),
    );
  } catch (e) {
    print('Error during Firebase initialization: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
