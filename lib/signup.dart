import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:trigger_news_1/login.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  ApiService apiService = ApiService();
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginForm,
        child: ListView(
          children: [
            Container(
              child: Image.asset(
                "assets/loginvectore.jpg",
                height: 300,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "Please Sign up to Continue.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[150],
                      // border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'Username',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[150],
                      // border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'UserEmail',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: TextFormField(
                    controller: mobilenumber,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[150],
                      // border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'Mobile No',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[150],
                      // border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: TextFormField(
                    controller: confirmpassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[150],
                      // border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.blue,
                    ),
                    onPressed: () async {
                      if (loginForm.currentState!.validate()) {
                        if (password.text.toString() ==
                            confirmpassword.text.toString()) {
                          var data = new Map<String, dynamic>();
                          data["username"] = username.text;
                          data["email"] = email.text;
                          data["mobilenum"] = mobilenumber.text;
                          data["password"] = password.text;
                          data["confirm_password"] = confirmpassword.text;

                          var login =
                              await apiService.postCall("user/adduser", data);
                          log('$login');
                          log('${login['messges']}');

                          if (login['success'] == 1) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                                (route) => false);
                          }
                        } else {
                          ToastMsg('Password is not match', 17, Colors.red);
                          setState(() {});
                        }
                      }
                    },
                    child: Text(
                      "Sign Up",
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text("Sign in"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ToastMsg(String msg, double fontsize, Color color) {
    ScaffoldMessenger.of(this.context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text("$msg"),
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
