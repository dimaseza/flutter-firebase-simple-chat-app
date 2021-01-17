import 'package:flutter/material.dart';
import 'package:flutter_chat_crew_course/services/auth_services.dart';
import 'package:get/get.dart';
import 'sign_up_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home Page"),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  await AuthServices.signOut();
                  Get.offAll(SignUpPage());
                },
                child: Text("SIGN OUT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
