import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:video_player/video_player.dart';

class Feedback1 extends StatefulWidget {
  const Feedback1({super.key});

  @override
  State<Feedback1> createState() => _Feedback1State();
}

class _Feedback1State extends State<Feedback1> {
  bool isChecked = false;
  SpeechToText speechToText = SpeechToText();
  bool event_name = false;
  TextEditingController All_responses_t = TextEditingController();
  PlatformFile? file;
  late VideoPlayerController _controller;
  ApiService apiService = ApiService();
  late SharedPreferences pref;
  var userid;
  File? image;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    log("userid ${userid}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            Container(
              height: 90,
              child: AppBar(
                title: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textScaleFactor: 1.0,
                          "Sahil",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          textScaleFactor: 1.0,
                          "Varachha, Surat,Gujarat",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                toolbarHeight: 120,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                backgroundColor: Color.fromRGBO(92, 179, 255, 1),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                children: [
                  Container(
                    child: Text(
                      textScaleFactor: 1.0,
                      "Feedback",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(92, 179, 255, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState1) {
                      return GestureDetector(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: [
                              'jpg',
                              'png',
                              'webp',
                              'gif',
                              'mp4'
                            ],
                          );

                          if (result != null) {
                            if (result.files.single.extension.toString() ==
                                "mp4") {
                              file = result.files.single;
                              _controller = VideoPlayerController.file(
                                  File(file!.path.toString()))
                                ..initialize().then((_) {
                                  setState(() {
                                    image = File(file!.path.toString());
                                  });
                                });

                              setState(() {});
                            } else {
                              file = result.files.single;
                              setState(() {
                                image = File(file!.path.toString());
                              });
                            }

                            print(file!.name);
                            print(file!.bytes);
                            print(file!.size);
                            print(file!.extension);
                            print(file!.path);
                            setState(() {});
                          } else {
                            print("null image");
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(10),
                          child: file != null
                              ? (file?.extension.toString() == "mp4")
                                  ? Container(
                                      child: _controller.value.isInitialized
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: VideoPlayer(_controller),
                                            )
                                          : Container(),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.file(
                                        File(
                                          file!.path.toString(),
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    )
                              : Image.asset(
                                  "assets/pickimage.png",
                                  fit: BoxFit.fill,
                                ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter All responses";
                              }
                              return null;
                            },
                            maxLength: 5000,
                            controller: All_responses_t,
                            decoration: InputDecoration(
                              hintText: "All responses",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              if (event_name == false) {
                                event_name = await speechToText.initialize();
                                setState(() {});
                                if (event_name == true) {
                                  All_responses_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        event_name = true;
                                        All_responses_t.text =
                                            result.recognizedWords;
                                      });
                                    },
                                  );
                                  setState(() {});
                                  showAnimatedDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return WillPopScope(
                                        child: AlertDialog(
                                          backgroundColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: Text(
                                                    "Google",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    event_name = false;
                                                    await speechToText.stop();
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .blue.shade800
                                                            .withOpacity(0.2),
                                                        shape: BoxShape.circle),
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      height: 80,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .blue.shade800
                                                              .withOpacity(0.2),
                                                          shape:
                                                              BoxShape.circle),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .blue
                                                                    .shade800,
                                                                shape: BoxShape
                                                                    .circle),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(
                                                          Icons.keyboard_voice,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: Text(
                                                    (All_responses_t
                                                            .text.isNotEmpty)
                                                        ? "${All_responses_t.text}"
                                                        : "Speak now",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onWillPop: () async {
                                          event_name = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return event_name != event_name;
                                        },
                                      );
                                    },
                                    animationType:
                                        DialogTransitionType.fadeRotate,
                                  );
                                }
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 55,
                              height: 59,
                              margin: EdgeInsets.only(right: 10, bottom: 25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue.shade300,
                              ),
                              child: Container(
                                child: Icon(
                                  Icons.keyboard_voice,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.red,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Text(
                        textScaleFactor: 1.0,
                        "I accept the terms and conditions",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(92, 179, 255, 1),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          var multipartFile =
                              await MultipartFile.fromFile(image!.path);
                          var param = new Map<String, dynamic>();
                          param['user_id'] = userid;
                          param['image'] = multipartFile;
                          param['eventname'] = All_responses_t.text;
                          var resdata = await apiService.postCall(
                              'feedback/addfeedback', param);
                          log("${resdata}");
                          All_responses_t.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        textScaleFactor: 1.0,
                        "Submit",
                      ),
                    ),
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
