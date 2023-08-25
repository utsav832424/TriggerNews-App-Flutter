import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:group_button/group_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:video_player/video_player.dart';

class realestate extends StatefulWidget {
  realestate({Key? key}) : super(key: key);

  @override
  State<realestate> createState() => _realestateState();
}

class _realestateState extends State<realestate> {
  bool isChecked = false;
  String dropdownvalue = "";
  SpeechToText speechToText = SpeechToText();
  bool address = false;
  TextEditingController adress = TextEditingController();
  bool pre_squre_fit = false;
  TextEditingController pre_squre_fit_t = TextEditingController();
  bool add_special_feature = false;
  TextEditingController add_special_feature_t = TextEditingController();
  TextEditingController find_the_area_t = TextEditingController();
  TextEditingController area_t = TextEditingController();
  TextEditingController contect_name_t = TextEditingController();
  TextEditingController contact_number_t = TextEditingController();
  PlatformFile? file;
  File? images;
  late GroupButtonController gbutton;
  int? g_button;
  late GroupButtonController gbutton1;
  int? g_button1;
  var userid;
  late VideoPlayerController _controller;
  final _formkey = GlobalKey<FormState>();
  ApiService apiService = ApiService();
  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    gbutton = GroupButtonController();
    gbutton1 = GroupButtonController();
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
              key: _formkey,
              child: ListView(
                padding: EdgeInsets.only(top: 5),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Basic details",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Aseet type"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: GroupButton(
                          maxSelected: 1,
                          controller: gbutton,
                          options: GroupButtonOptions(
                            spacing: 5,
                            buttonWidth: 100,
                            buttonHeight: 30,
                            selectedBorderColor: Colors.black12,
                            selectedColor: Colors.yellow.shade700,
                            borderRadius: BorderRadius.circular(12),
                            direction: Axis.horizontal,
                            unselectedBorderColor: Colors.black,
                            mainGroupAlignment: MainGroupAlignment.center,
                            crossGroupAlignment: CrossGroupAlignment.center,
                            selectedTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            groupingType: GroupingType.wrap,
                          ),
                          onSelected: (value, index, isSelected) {
                            setState(() {
                              g_button = index;
                              print("${g_button}");
                            });
                          },
                          buttons: [
                            "House",
                            "Flat",
                            "Plot",
                            "shop",
                            "storage",
                            "Other",
                            "Builder ",
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Where are you looking for ?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.bottomLeft,
                        width: MediaQuery.of(context).size.width,
                        child: GroupButton(
                          maxSelected: 1,
                          controller: gbutton1,
                          options: GroupButtonOptions(
                            spacing: 15,
                            buttonWidth: 70,
                            buttonHeight: 30,
                            selectedBorderColor: Colors.black12,
                            selectedColor: Colors.yellow.shade700,
                            borderRadius: BorderRadius.circular(12),
                            direction: Axis.horizontal,
                            unselectedBorderColor: Colors.black,
                            mainGroupAlignment: MainGroupAlignment.center,
                            crossGroupAlignment: CrossGroupAlignment.center,
                            selectedTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            groupingType: GroupingType.wrap,
                          ),
                          onSelected: (value, index, isSelected) {
                            setState(() {
                              g_button1 = index;
                              print("${g_button1}");
                            });
                          },
                          buttons: [
                            "Sell",
                            "Rent",
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Image or Video of The Property",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
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
                                        images = File(file!.path.toString());
                                      });
                                    });

                                  setState(() {});
                                } else {
                                  file = result.files.single;
                                  setState(() {
                                    images = File(file!.path.toString());
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
                                                  child:
                                                      VideoPlayer(_controller),
                                                )
                                              : Container(),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Property details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Find the area";
                                  }
                                  return null;
                                },
                                maxLength: 200,
                                controller: find_the_area_t,
                                decoration: InputDecoration(
                                  hintText: "Find the area",
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
                          Container(
                            width: 55,
                            height: 59,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue.shade300,
                            ),
                            child: Container(
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Address";
                                  }
                                  return null;
                                },
                                maxLength: 200,
                                controller: adress,
                                decoration: InputDecoration(
                                  hintText: "Address",
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
                                  if (address == false) {
                                    address = await speechToText.initialize();
                                    setState(() {});
                                    if (address == true) {
                                      adress.clear();
                                      await speechToText.listen(
                                        onResult: (result) {
                                          setState(() {
                                            address = true;
                                            adress.text =
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
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Text(
                                                        "Google",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .grey.shade700,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        address = false;
                                                        await speechToText
                                                            .stop();
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .blue.shade800
                                                                .withOpacity(
                                                                    0.2),
                                                            shape: BoxShape
                                                                .circle),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          height: 80,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .blue.shade800
                                                                  .withOpacity(
                                                                      0.2),
                                                              shape: BoxShape
                                                                  .circle),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                            height: 60,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .blue
                                                                    .shade800,
                                                                shape: BoxShape
                                                                    .circle),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_voice,
                                                              color:
                                                                  Colors.white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Text(
                                                        (adress.text.isNotEmpty)
                                                            ? "${adress.text}"
                                                            : "Speak now",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .grey.shade700,
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
                                              address = false;
                                              await speechToText.stop();
                                              Navigator.pop(context);
                                              setState(() {});
                                              return address != adress;
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
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 24),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Area";
                                    }
                                    return null;
                                  },
                                  controller: area_t,
                                  decoration: InputDecoration(
                                      hintText: "Area",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      floatingLabelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade300))),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 59,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.blue)),
                                child: DropdownButtonFormField<String>(
                                  // alignment: Alignment.center,
                                  isExpanded: true,
                                  hint: Text("Fut/Square Fit"),
                                  value: dropdownvalue.isEmpty
                                      ? null
                                      : dropdownvalue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownvalue = value!;
                                    });
                                  },
                                  items: [
                                    // for (var data in [1, 2, 3, 4])

                                    DropdownMenuItem<String>(
                                      value: '1',
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Yard",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '2',
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Eker",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '3',
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Knot",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '4',
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Cent",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '5',
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Number",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Price Per Square Fit";
                                  }
                                  return null;
                                },
                                maxLength: 200,
                                controller: pre_squre_fit_t,
                                decoration: InputDecoration(
                                  hintText: "Price per Square fit",
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
                                  if (pre_squre_fit == false) {
                                    pre_squre_fit =
                                        await speechToText.initialize();
                                    setState(() {});
                                    if (pre_squre_fit == true) {
                                      pre_squre_fit_t.clear();
                                      await speechToText.listen(
                                        onResult: (result) {
                                          setState(() {
                                            pre_squre_fit = true;
                                            pre_squre_fit_t.text =
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
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Text(
                                                        "Google",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .grey.shade700,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        pre_squre_fit = false;
                                                        await speechToText
                                                            .stop();
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .blue.shade800
                                                                .withOpacity(
                                                                    0.2),
                                                            shape: BoxShape
                                                                .circle),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          height: 80,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .blue.shade800
                                                                  .withOpacity(
                                                                      0.2),
                                                              shape: BoxShape
                                                                  .circle),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                            height: 60,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .blue
                                                                    .shade800,
                                                                shape: BoxShape
                                                                    .circle),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_voice,
                                                              color:
                                                                  Colors.white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Text(
                                                        (pre_squre_fit_t.text
                                                                .isNotEmpty)
                                                            ? "${pre_squre_fit_t.text}"
                                                            : "Speak now",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .grey.shade700,
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
                                              pre_squre_fit = false;
                                              await speechToText.stop();
                                              Navigator.pop(context);
                                              setState(() {});
                                              return pre_squre_fit !=
                                                  pre_squre_fit;
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
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 24),
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
                              margin: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Add Spacial Features";
                                  }
                                  return null;
                                },
                                maxLength: 5000,
                                controller: add_special_feature_t,
                                decoration: InputDecoration(
                                    hintText: "Add Special Features",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    floatingLabelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ),
                          StatefulBuilder(
                            builder: (context, setState) {
                              return GestureDetector(
                                onTap: () async {
                                  if (add_special_feature == false) {
                                    add_special_feature =
                                        await speechToText.initialize();
                                    setState(() {});
                                    if (add_special_feature == true) {
                                      add_special_feature_t.clear();
                                      await speechToText.listen(
                                        onResult: (result) {
                                          setState(() {
                                            add_special_feature = true;
                                            add_special_feature_t.text =
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
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Text(
                                                        "Google",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .grey.shade700,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        add_special_feature =
                                                            false;
                                                        await speechToText
                                                            .stop();
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .blue.shade800
                                                                .withOpacity(
                                                                    0.2),
                                                            shape: BoxShape
                                                                .circle),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          height: 80,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .blue.shade800
                                                                  .withOpacity(
                                                                      0.2),
                                                              shape: BoxShape
                                                                  .circle),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                            height: 60,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .blue
                                                                    .shade800,
                                                                shape: BoxShape
                                                                    .circle),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_voice,
                                                              color:
                                                                  Colors.white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Text(
                                                        (add_special_feature_t
                                                                .text
                                                                .isNotEmpty)
                                                            ? "${add_special_feature_t.text}"
                                                            : "Speak now",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .grey.shade700,
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
                                              add_special_feature = false;
                                              await speechToText.stop();
                                              Navigator.pop(context);
                                              setState(() {});
                                              return add_special_feature !=
                                                  add_special_feature;
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
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 24),
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
                                    return "Enter Contact Name";
                                  }
                                  return null;
                                },
                                controller: contect_name_t,
                                maxLength: 255,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: "Contact Name",
                                  floatingLabelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Contact number";
                                    }
                                    return null;
                                  },
                                  controller: contact_number_t,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    hintText: "Contact number",
                                    floatingLabelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                            ),
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
                            "I accept the terms and conditions",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(92, 179, 255, 1),
                            onPrimary: Colors.white,
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              var multifile =
                                  await MultipartFile.fromFile(images!.path);
                              var data = Map<String, dynamic>();
                              data["user_id"] = userid;
                              data["asset_type"] = g_button;
                              data["looking_for"] = g_button1;
                              data["image"] = multifile;
                              data["findarea"] = find_the_area_t.text;
                              data["address"] = adress.text;
                              data["area"] = area_t.text;
                              data["sqaurefit"] = dropdownvalue;
                              data["price_sqaurefit"] = pre_squre_fit_t.text;
                              data["add_features"] = add_special_feature_t.text;
                              data["contact_name"] = contect_name_t.text;
                              data["contact_number"] = contact_number_t.text;
                              var resdata = await apiService.postCall(
                                  "realestate/addrealestate", data);

                              if (resdata["success"] == 1) {
                                g_button;
                                g_button1;
                                find_the_area_t.clear();
                                adress.clear();
                                area_t.clear();
                                dropdownvalue = "";
                                pre_squre_fit_t.clear();
                                add_special_feature_t.clear();
                                contect_name_t.clear();
                                contact_number_t.clear();
                                Navigator.pop(context);
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
