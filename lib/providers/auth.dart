import 'dart:math';

import 'package:blooddonarapp/dashboard.dart';
import 'package:blooddonarapp/model/donarmodel.dart';
import 'package:blooddonarapp/model/requestmodel.dart';
import 'package:blooddonarapp/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blooddonarapp/view/loginscreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController bloodgroupcontroller = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  TextEditingController bloodunitcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController bloodunit = TextEditingController();
  TextEditingController relationcontroller = TextEditingController();

  List<String> gender = ['Male', 'Female', 'Other'];
  List<String> relations = ['Father', 'Mother', 'Brother', 'Sister', 'Other'];

  bool isdropdown = false;
  String selectgender = '';
  bool hidepassword = true;
  bool hideconformpassword = true;
  bool loading = false;
  bool loadingregister = false;
  final loginformkey = GlobalKey<FormState>();
  final registerformkey = GlobalKey<FormState>();
  final donarkey = GlobalKey<FormState>();
  final requestkey = GlobalKey<FormState>();

  String name = 'Aakash B.K';

  hidepasswords() {
    hidepassword = !hidepassword;
    notifyListeners();
  }

  conformhidepassword() {
    hideconformpassword = !hideconformpassword;
    notifyListeners();
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void updateDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  void updateTime(TimeOfDay newTime) {
    selectedTime = newTime;
    notifyListeners();
  }

  UserData? _user;
  UserData? get user => _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(context) async {
    loading = true;
    notifyListeners();

    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      print(authResult);
      // Check if sign-in is successful
      if (authResult.user != null) {
        // Update the _user field with the signed-in user's data
        _user = UserData(
            uid: authResult.user!.uid,
            username: authResult.user!.displayName ??
                "", // Use an empty string if displayName is null
            email: authResult.user!.email ?? "",
            phonenumber: authResult.user!.phoneNumber ??
                '' // Use an empty string if email is null
            );
      }
      if (_user != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login Succesffully!!!')));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('invalid Credentials')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }

    loading = false;
    notifyListeners();
  }

  Future<void> registerWithUsernamePhoneAndPassword(String username,
      String email, String password, String phoneNumber) async {
    loadingregister = true;
    notifyListeners();
    try {
      // Check if the email is not empty
      if (email.isEmpty) {
        throw FirebaseAuthException(
          code: 'missing-email',
          message: 'Email is required for registration.',
        );
      }

      // Create the user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      // Update the user's display name with the username
      // ignore: deprecated_member_use
      await userCredential.user?.updateProfile(displayName: username);
      await userCredential.user?.reload();

      // Update the phone number (This is a placeholder as Firebase does not provide direct phone number access)
      // Capture user credentials and notify listeners
      _user = UserData(
        uid: userCredential.user?.uid ?? '',
        username: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
        // Retrieve the updated phone number
        phonenumber: phoneNumber,
      );

      loadingregister = false;
      notifyListeners();
    } catch (e) {
      print("Registration failed: $e");
      throw e;
    }
  }

  signOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    notifyListeners();
  }

  final List<RequestBloodModel> _listofrequestblooad = [];
  List<RequestBloodModel> get requestlist => _listofrequestblooad;
  final List<DonarModel> _listofdonars = [];
  List<DonarModel> get donars => _listofdonars;
  bool loadingdonarslist = false;
  bool loadingrequestlist = false;

  late DonarModel _donar;
  DonarModel? get donar => _donar;
  late RequestBloodModel _request;
  RequestBloodModel? get request => _request;

  Future<void> addUserInformation(
    String name,
    String address,
    String email,
    String age,
    String gender,
    String phoneNumber,
    String bloodgroup,
    context,
  ) async {
    loadingdonarslist = true;
    notifyListeners();
    try {
      DonarModel donarModel = DonarModel(
        name: name,
        bloodgroup: bloodgroup,
        address: address,
        email: email,
        age: age,
        gender: gender,
        phonenumber: phoneNumber,
      );

      // Convert the DonarModel object to a Map
      Map<String, dynamic> donorData = donarModel.tojson();

      var donorRef =
          await FirebaseFirestore.instance.collection('users').add(donorData);

      if (donorRef != null) {
        // Save user information to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('name', name);
        prefs.setString('bloodgroup', bloodgroup);
        prefs.setString('address', address);
        prefs.setString('email', email);
        prefs.setString('age', age);
        prefs.setString('gender', gender);
        prefs.setString('phonenumber', phoneNumber);

        _donar = DonarModel(
            name: name,
            bloodgroup: bloodgroup,
            address: address,
            email: email,
            age: age,
            gender: gender,
            phonenumber: phoneNumber);

        if (_donar != null) {
          addDonar(_donar);

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Thank You For Saving Life')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Donor creation failed')));
        }
      }

      print('Donor added with ID: ${donorRef.id}');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
      print('Error adding user: $e');
    }
  }

  void addDonar(DonarModel donar) {
    _listofdonars.add(donar);
    notifyListeners();
  }

  void removeDonar(DonarModel donar) {
    _listofdonars.remove(donar);
    notifyListeners();
  }

  Future<void> addRequestforblood(
    String location,
    String date,
    String time,
    String gender,
    String relation,
    String phoneNumber,
    String bloodgroup,
    context,
  ) async {
    loadingrequestlist = true;
    notifyListeners();
    try {
      RequestBloodModel requestBloodModel = RequestBloodModel(
        location: location,
        date: date,
        time: time,
        name: name,
        phonenumber: phoneNumber,
        bloodgroup: bloodgroup,
        gender: gender,
        relation: relation,
      );

      // Convert the RequestBloodModel object to a Map
      Map<String, dynamic> requestBloodData = requestBloodModel.tojson();

      var requested = await FirebaseFirestore.instance
          .collection('users')
          .add(requestBloodData);

      if (requested != null) {
        // Save blood request information to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('request_location', location);
        prefs.setString('request_date', date);
        prefs.setString('request_time', time);
        prefs.setString('request_bloodgroup', bloodgroup);
        prefs.setString('request_name', name);
        prefs.setString('relation', relation);
        prefs.setString('request_phonenumber', phoneNumber);
        prefs.setString('request_gender', gender);

        _request = RequestBloodModel(
          location: location,
          date: date,
          time: time,
          name: name,
          phonenumber: phoneNumber,
          bloodgroup: bloodgroup,
          gender: gender,
          relation: relation,
        );

        if (_request != null) {
          addrequest(_request);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Blood Requested Successfully Check in History')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Donor creation failed')));
        }
      }

      print('Request added with ID: ${requested.id}');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
      print('Error adding request: $e');
    }
  }

  void addrequest(RequestBloodModel requst) {
    _listofrequestblooad.add(requst);
    notifyListeners();
  }

  void removerequest(RequestBloodModel requst) {
    _listofrequestblooad.remove(requst);
    notifyListeners();
  }
}
