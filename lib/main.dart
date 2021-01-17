import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_crew_course/pages/sign_up_page.dart';
import 'package:flutter_chat_crew_course/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices.firebaseUserStream,
        builder: (context, snapshot) {
          return GetMaterialApp(
            title: "Chat App",
            debugShowCheckedModeBanner: false,
            home: SignUpPage(),
          );
        });
  }
}
