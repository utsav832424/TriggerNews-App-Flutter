import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:trigger_news_1/forgotpassword.dart';
import 'package:trigger_news_1/signup.dart';
import 'package:trigger_news_1/statechoose.dart';
import "dart:developer";

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  ApiService apiService = ApiService();
  late SharedPreferences pref;
  var userid;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  List data1 = [];
  List data2 = [];
  List data3 = [];
  init() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    log("userid ${userid}");
    if (userid != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => statechoose(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: ListView(
          children: [
            Container(
              child: Image.asset(
                "assets/signupvectore.jpg",
                height: 300,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "Please Sign in to Continue.",
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
                  margin: EdgeInsets.all(15),
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
                      hintText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Forgot_Password(),
                              ));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      if (_key.currentState!.validate()) {
                        var data = new Map<String, dynamic>();
                        data["email"] = email.text;
                        data["password"] = password.text;

                        var resData =
                            await apiService.postCall("user/login", data);
                        log('$resData');
                        if (resData["success"] == 1) {
                          await pref.setString(
                              'id', resData['data'][0]['id'].toString());
                          await pref.setString(
                              'username', resData['data'][0]['username']);
                          await pref.setString(
                              'email', resData['data'][0]['email']);

                          await pref.setString(
                              'mobilenum', resData['data'][0]['mobilenum']);
                          await pref.setString(
                              'profile_img', resData['data'][0]['profile_img']);

                          await pref.setString('token', resData['tokken']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => statechoose(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Sign in",
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
                    "Don't have an account?",
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ),
                      );
                    },
                    child: Text("Sign up"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
