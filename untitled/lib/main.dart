import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/phoneauth.dart';
import 'package:untitled/opt.dart';  // Ensure this import is correct

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA1FiNymcPzKIrlNpd6iT69dG5wyZmc3yo",
      appId: "1:616897718694:android:ff1f9c7bc7aa43a2230767",
      messagingSenderId: "616897718694",
      projectId: "fir-newauth-a9a15",
    ),
  );

  runApp(MaterialApp(
    home: const Phonepage(),
    routes: {
      'otp': (context) => const otp(), // Ensure otp() is correctly defined as a const constructor
    },
  ));
}
