import 'package:firebase_auth/firebase_auth.dart';

// Inside your signup function
Future<void> signInWithEmailAndPassword(
  String email,
  String password,
) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    // Login successful, navigate to another screen or perform actions
  } catch (e) {
    // Handle login errors (e.g., invalid email/password)
    print(e.toString());
  }
}

Future<void> registerWithUsernamePhoneAndPassword(
    String username, String phoneNumber, String password) async {
  try {
    // Create a user with email and password
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: '$phoneNumber@myapp.com', // Use a placeholder email
      password: password,
    );

    // Update the user's display name with the username
    // ignore: deprecated_member_use
    await userCredential.user?.updateProfile(displayName: username);
    await userCredential.user?.reload();

    // Send a verification code to the user's phone number (optional)
    // You can use Firebase Phone Authentication here.
    // For simplicity, this example doesn't include phone verification.

    print("User registered: ${userCredential.user?.uid}");
  } catch (e) {
    print("Registration failed: $e");
    throw e; // Handle registration errors as needed.
  }
}
