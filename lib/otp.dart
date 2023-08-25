import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:trigger_news_1/login.dart';
import 'package:trigger_news_1/selocation.dart';
import 'package:trigger_news_1/statechoose.dart';

class OTP extends StatefulWidget {
  String v_code;
  String mobile;

  OTP(this.v_code, this.mobile);
  static bool t = false;
  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String smsotp = "";
  String v_cod = "";

  late SharedPreferences pref;
  ApiService apiService = ApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            "assets/otp.jpg",
            height: 300,
          ),
          Text(
            "Verify OTP",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "Please enter 4 digit code sent to \nyour mobile number",
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.black,
              focusedBorderColor: Colors.blue,
              showFieldAsBox: true,
              borderWidth: 2,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                smsotp = verificationCode;
                // if (temp = false) {
                smsotp = verificationCode;
                print(smsotp);
                // } else {
                // v_cod = verificationCode;
                // print(smsotp);
                // }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "If you don't receive the code ?",
              ),
              TextButton(
                onPressed: () async {
                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: '+91 ${widget.mobile}',
                  //   verificationCompleted:
                  //       (PhoneAuthCredential credential) async {
                  //     await auth.signInWithCredential(credential);
                  //   },
                  //   verificationFailed: (FirebaseAuthException e) {
                  //     if (e.code == 'invalid-phone-number') {
                  //       print('The provided phone number is not valid.');
                  //     }
                  //   },
                  //   codeSent: (String verificationId, int? resendToken) {
                  //     v_cod = verificationId;
                  //   },
                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                  // );
                },
                child: Text(
                  "Resend",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
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
                try {
                  String smsCode = smsotp;

                  print(smsCode);
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.v_code, smsCode: smsCode);

                  await auth
                      .signInWithCredential(credential)
                      .then((value) async {
                    OTP.t = true;
                    setState(() {});
                  });
                } catch (e) {
                  Fluttertoast.showToast(
                    msg: "Wrong OTP",
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
                if (OTP.t == true) {
                  // var data = new Map<String, dynamic>();
                  // data["username"] = "Sahil";
                  // data["email"] = "sahil@gmail.com";
                  // data["mobilenum"] = widget.mobile;
                  // data["password"] = "132cwv";
                  // data["confirm_password"] = "132cwv";

                  // var login = await apiService.postCall("user/adduser", data);
                  // log('$login');
                  // log('${login['messges']}');

                  // if (login['success'] == 1) {
                  //   var resData =
                  //       await apiService.getCall("user/getuserbymobile");
                  //   log("${resData}");
                  //   if (resData["success"] == 1) {
                  //     await pref.setString(
                  //         'id', resData['data'][0]['id'].toString());
                  //   }
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => statechoose(),
                      ),
                      (route) => false);
                  // }
                }
              },
              child: Text(
                "Verify",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
