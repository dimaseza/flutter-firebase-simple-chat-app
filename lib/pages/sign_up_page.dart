import 'package:flutter/material.dart';
import 'package:flutter_chat_crew_course/services/auth_services.dart';
import 'package:get/get.dart';
import 'sign_in_page.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void signUp() async {
    try {
      setState(() {
        isLoading = true;
      });
      formKey.currentState.save();
      await AuthServices.signUpWithEmailAndPassword(
        fullnameController.text,
        emailController.text,
        passwordController.text,
      );
      Get.offAll(HomePage());
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fullnameController,
                        validator: (value) {
                          return value.isEmpty ? "Enter fullname" : null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: "Fullname",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                          labelText: "Fullname",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          return emailController.text.contains('@')
                              ? null
                              : "Enter correct email";
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          return value.length < 6
                              ? "Enter min. 6 characters"
                              : null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        height: 44,
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: signUp,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          color: Colors.blue,
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(SignInPage());
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
