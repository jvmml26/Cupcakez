import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyATIOwcoEGwnNH5BsZBlJSHzJeaEGqe-3c",
            authDomain: "cupcakez-7fwi0h.firebaseapp.com",
            projectId: "cupcakez-7fwi0h",
            storageBucket: "cupcakez-7fwi0h.appspot.com",
            messagingSenderId: "953051232660",
            appId: "1:953051232660:web:8d38197a597ba594737781"));
  } else {
    await Firebase.initializeApp();
  }
}
