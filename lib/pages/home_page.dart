import 'package:flutter/material.dart';
import 'package:flutter_chat_crew_course/services/auth_services.dart';
import 'package:flutter_chat_crew_course/widgets/chats/messages.dart';
import 'package:flutter_chat_crew_course/widgets/chats/new_message.dart';
import 'package:get/get.dart';
import 'sign_in_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
        backgroundColor: Colors.blue,
        actions: [
          GestureDetector(
            onTap: () async {
              await AuthServices.signOut();
              Get.offAll(SignInPage());
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
