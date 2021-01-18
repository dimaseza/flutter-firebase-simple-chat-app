import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_crew_course/services/auth_services.dart';
import 'pages/sign_in_page.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Chat App",
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: AuthServices.firebaseUserStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return SignInPage();
          }
        },
      ),
    );
  }
}
