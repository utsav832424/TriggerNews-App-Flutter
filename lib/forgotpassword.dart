import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:trigger_news_1/otp.dart';
import 'package:trigger_news_1/statechoose.dart';

class Forgot_Password extends StatefulWidget {
  Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  // late SharedPreferences pref;
  String v_code = "";
  TextEditingController mobile = TextEditingController();
  String smsotp = "";
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  ApiService apiService = ApiService();
  FirebaseAuth auth = FirebaseAuth.instance;
  var userid;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    // pref = await SharedPreferences.getInstance();
    // userid = pref.getString("id");
    // log("userid ${userid}");
    // if (userid != null) {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => statechoose(),
    //       ),
    //       (route) => false);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
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
                    // "Forgot Password",
                    "Login",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    // "Please Enter your email address recieve a Verification code.",
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Mobile number";
                      }
                      return null;
                    },
                    controller: mobile,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[150],
                      // border: InputBorder.none,
                      // labelText: 'Enter Name',
                      hintText: 'Enter Mobile No',
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
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
                      if (_formkey.currentState!.validate()) {
                        // var resData = await apiService
                        //     .getCall("user/getuserbymobile/${mobile.text}");
                        // log("${resData}");
                        // if (resData["success"] == 1) {
                        //   await pref.setString(
                        //       'id', resData['data'][0]['id'].toString());
                        // }

                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+91 ${mobile.text}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) async {
                            await auth.signInWithCredential(credential);
                          },
                          verificationFailed: (FirebaseAuthException e) {
                            if (e.code == 'invalid-phone-number') {
                              print('The provided phone number is not valid.');
                              Fluttertoast.showToast(
                                msg: "Please try again otp failed",
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            }
                          },
                          codeSent:
                              (String verificationId, int? resendToken) async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OTP(verificationId, mobile.text),
                              ),
                            );
                            // v_code = verificationId;
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }
                    },
                    child: Text(
                      "Send OTP",
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   width: MediaQuery.of(context).size.width,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       onPrimary: Colors.white,
                //       primary: Colors.blue,
                //     ),
                //     onPressed: () async {
                //       String smsCode = smsotp;

                //       print(smsCode);
                //       PhoneAuthCredential credential =
                //           await PhoneAuthProvider.credential(
                //               verificationId: v_code, smsCode: smsCode);

                //       await auth.signInWithCredential(credential).then((value) {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => statechoose(),
                //           ),
                //         );
                //       });
                //     },
                //     child: Text(
                //       "Verify",
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
