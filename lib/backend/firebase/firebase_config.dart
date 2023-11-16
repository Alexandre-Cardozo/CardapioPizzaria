import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDR5NZJ9PyFWTKNEIVFKQDAjXniJNaLITU",
            authDomain: "pizzahut-e350b.firebaseapp.com",
            projectId: "pizzahut-e350b",
            storageBucket: "pizzahut-e350b.appspot.com",
            messagingSenderId: "829179173617",
            appId: "1:829179173617:web:6a34d58529678a0b6f6750"));
  } else {
    await Firebase.initializeApp();
  }
}
