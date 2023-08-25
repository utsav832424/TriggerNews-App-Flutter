import 'dart:io';
import 'dart:math';
import 'dart:developer' as d;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:video_player/video_player.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  bool isChecked = false;
  bool light = false;
  SpeechToText speechToText = SpeechToText();
  bool event_name = false;
  TextEditingController event_name_t = TextEditingController();
  bool manager = false;
  TextEditingController manager_t = TextEditingController();
  bool place = false;
  TextEditingController place_t = TextEditingController();
  bool phone_number = false;
  TextEditingController highlights_t = TextEditingController();
  bool additional_information = false;
  TextEditingController additional_information_t = TextEditingController();
  TextEditingController time_t = TextEditingController();
  TextEditingController time1_t = TextEditingController();
  TextEditingController date_t = TextEditingController();
  TextEditingController phone_num_t = TextEditingController();
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
    d.log("userid ${userid}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            child: Form(
              key: _key,
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                children: [
                  Container(
                    child: Text(
                      textScaleFactor: 1.0,
                      "Event",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(92, 179, 255, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
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
                                return "Enter Event Name";
                              }
                              return null;
                            },
                            maxLength: 200,
                            controller: event_name_t,
                            decoration: InputDecoration(
                              hintText: "Event name",
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
                                  event_name_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        event_name = true;
                                        event_name_t.text =
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
                                                    (event_name_t
                                                            .text.isNotEmpty)
                                                        ? "${event_name_t.text}"
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
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Manager";
                              }
                              return null;
                            },
                            maxLength: 5000,
                            controller: manager_t,
                            decoration: InputDecoration(
                              hintText: "Manager",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              floatingLabelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                              if (manager == false) {
                                manager = await speechToText.initialize();
                                setState(() {});
                                if (manager == true) {
                                  manager_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        manager = true;
                                        manager_t.text = result.recognizedWords;
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
                                                    manager = false;
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
                                                    (manager_t.text.isNotEmpty)
                                                        ? "${manager_t.text}"
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
                                          manager = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return manager != manager;
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Time";
                              }
                              return null;
                            },
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData(),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  DateTime time = DateTime.now();
                                  var h = pickedTime.hour;
                                  var m = pickedTime.minute;
                                  var s = time.second;

                                  time1_t.text = "$h:$m:$s";
                                  time_t.text = "$h:$m";
                                });
                              } else {
                                setState(() {
                                  time_t.clear();
                                });
                              }
                            },
                            controller: time_t,
                            decoration: InputDecoration(
                              hintText: "Time",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              floatingLabelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Date";
                              }
                              return null;
                            },
                            controller: date_t,
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData(),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickeddate != null) {
                                setState(() {
                                  var d = pickeddate.day;
                                  var m = pickeddate.month;
                                  var y = pickeddate.year;
                                  date_t.text = "$y-$m-$d";
                                });
                              } else {
                                setState(() {
                                  date_t.clear();
                                });
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Date",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                floatingLabelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade300))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Place";
                              }
                              return null;
                            },
                            maxLength: 5000,
                            controller: place_t,
                            decoration: InputDecoration(
                                hintText: "Place",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                floatingLabelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade300))),
                          ),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              if (place == false) {
                                place = await speechToText.initialize();
                                setState(() {});
                                if (place == true) {
                                  place_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        place = true;
                                        place_t.text = result.recognizedWords;
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
                                                    place = false;
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
                                                    (place_t.text.isNotEmpty)
                                                        ? "${place_t.text}"
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
                                          place = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return place != place;
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Highlights";
                              }
                              return null;
                            },
                            maxLength: 5000,
                            controller: highlights_t,
                            decoration: InputDecoration(
                                hintText: "Highlights",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                floatingLabelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade300))),
                          ),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              if (phone_number == false) {
                                phone_number = await speechToText.initialize();
                                setState(() {});
                                if (phone_number == true) {
                                  highlights_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        phone_number = true;
                                        highlights_t.text =
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
                                                    phone_number = false;
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
                                                    (highlights_t
                                                            .text.isNotEmpty)
                                                        ? "${highlights_t.text}"
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
                                          phone_number = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return phone_number != phone_number;
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
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Phone number";
                        }
                        return null;
                      },
                      maxLength: 10,
                      controller: phone_num_t,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        hintText: "Phone number",
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Additional information";
                              }
                              return null;
                            },
                            maxLength: 5000,
                            controller: additional_information_t,
                            decoration: InputDecoration(
                              hintText: "Additional information",
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
                              if (additional_information == false) {
                                additional_information =
                                    await speechToText.initialize();
                                setState(() {});
                                if (additional_information == true) {
                                  additional_information_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        additional_information = true;
                                        additional_information_t.text =
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
                                                    additional_information =
                                                        false;
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
                                                    (additional_information_t
                                                            .text.isNotEmpty)
                                                        ? "${additional_information_t.text}"
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
                                          additional_information = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return additional_information !=
                                              additional_information;
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
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(92, 179, 255, 1),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          var mulitpale =
                              await MultipartFile.fromFile(image!.path);
                          var data = Map<String, dynamic>();
                          data["user_id"] = userid;
                          data["image"] = mulitpale;
                          data["eventname"] = event_name_t.text;
                          data["manager"] = manager_t.text;
                          data["time"] = time1_t.text;
                          data["date"] = date_t.text;
                          data["place"] = place_t.text;
                          data["phone_number"] = phone_num_t.text;
                          data["highlights"] = highlights_t.text;
                          data["additional_information"] =
                              additional_information_t.text;
                          var resdata =
                              await apiService.postCall("event/addEvent", data);
                          if (resdata['success'] == 1) {
                            setState(() {
                              event_name_t.clear();
                              manager_t.clear();
                              time_t.clear();
                              time1_t.clear();
                              date_t.clear();
                              place_t.clear();
                              highlights_t.clear();
                              phone_num_t.clear();
                              Navigator.pop(context);
                            });
                          }
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
          ),
        ],
      ),
    );
  }
}
