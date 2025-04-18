import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC3wfYzgKTm3mM9_zWVQW7jQzBKLKSQAss",
            authDomain: "project1-4131c.firebaseapp.com",
            projectId: "project1-4131c",
            storageBucket: "project1-4131c.appspot.com",
            messagingSenderId: "842101594836",
            appId: "1:842101594836:web:f23f9c40e56f0b9051f941",
            measurementId: "G-L39WGB8N5B"));
  } else {
    await Firebase.initializeApp();
  }
}
