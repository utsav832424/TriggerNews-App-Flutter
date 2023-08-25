import 'dart:io';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:video_player/video_player.dart';

class advertisement extends StatefulWidget {
  const advertisement({super.key});

  @override
  State<advertisement> createState() => _advertisementState();
}

class _advertisementState extends State<advertisement> {
  File? image;
  bool isChecked = false;
  String select_destrict = "";
  String categoryvalue = "";
  String select_category = "";
  PlatformFile? file;
  late VideoPlayerController _controller;
  SpeechToText speechToText = SpeechToText();
  bool heading = false;
  TextEditingController title_t = TextEditingController();
  bool company_name = false;
  TextEditingController company_name_t = TextEditingController();
  bool price = false;
  TextEditingController price_t = TextEditingController();
  bool details = false;
  TextEditingController details_t = TextEditingController();
  bool website = false;
  TextEditingController website_t = TextEditingController();
  bool address = false;
  TextEditingController address_t = TextEditingController();
  TextEditingController moblie_num_t = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool space = false;
  ApiService apiService = ApiService();
  late SharedPreferences pref;
  var userid;

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    getState();
  }

  List data1 = [];
  List data2 = [];
  List city = [];
  init() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    log("userid ${userid}");
    var resdata = await apiService.getCall('category/getCategory');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
    });
  }

  getState() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    log("userid ${userid}");
    var resdata = await apiService.getCall('state/getstate');
    log("${resdata}");
    setState(() {
      data2 = resdata['data'];
    });
  }

  getCity(var index) async {
    log("${index} kfdghfghf");
    var resdata = await apiService.getCall('city/getcity/${index}');
    log("${resdata}");
    setState(() {
      city = resdata['data'];
    });
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
                padding: EdgeInsets.only(top: 20),
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    child: Text(
                      textScaleFactor: 1.0,
                      "Advertisement",
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
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Title";
                              }
                              return null;
                            },
                            maxLength: 255,
                            controller: title_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: "Title",
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              if (heading == false) {
                                heading = await speechToText.initialize();
                                setState(() {});
                                if (heading == true) {
                                  title_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        heading = true;
                                        title_t.text = result.recognizedWords;
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
                                                    heading = false;
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
                                                    (title_t.text.isNotEmpty)
                                                        ? "${title_t.text}"
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
                                          heading = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return heading != heading;
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
                              margin: EdgeInsets.only(bottom: 25, right: 10),
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
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Company name";
                              }
                              return null;
                            },
                            maxLength: 255,
                            controller: company_name_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: "Company name",
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              if (company_name == false) {
                                company_name = await speechToText.initialize();
                                setState(() {});
                                if (company_name == true) {
                                  company_name_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        company_name = true;
                                        company_name_t.text =
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
                                                    company_name = false;
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
                                                    (company_name_t
                                                            .text.isNotEmpty)
                                                        ? "${company_name_t.text}"
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
                                          company_name = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return company_name != company_name;
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
                                  left: 10, right: 10, bottom: 25),
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
                      hint: Text("Select District"),
                      value: select_destrict.isEmpty ? null : select_destrict,
                      onChanged: (String? value) {
                        setState(() {
                          select_destrict = value!;
                          log("${select_destrict}");
                          getCity(value);
                          // select_category = '';
                        });
                      },
                      items: [
                        for (var data in data2)
                          DropdownMenuItem<String>(
                            value: '${data["id"]}',
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${data["name"]}",
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
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
                      hint: Text("Select City"),
                      value: select_category.isEmpty ? null : select_category,
                      onChanged: (String? value) {
                        setState(() {
                          select_category = value!;
                        });
                      },
                      items: [
                        for (var data in city)
                          DropdownMenuItem<String>(
                            value: '${data["id"]}',
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${data["cityname"]}",
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
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
                                return "Enter Price";
                              }
                              return null;
                            },
                            controller: price_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: "Price",
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              if (price == false) {
                                price = await speechToText.initialize();
                                setState(() {});
                                if (price == true) {
                                  price_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        price = true;
                                        price_t.text = result.recognizedWords;
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
                                                    price = false;
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
                                                    (price_t.text.isNotEmpty)
                                                        ? "${price_t.text}"
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
                                          price = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return price != price;
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
                                  left: 10,
                                  right: 10,
                                  bottom: (space == true) ? 23 : 0),
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
                                return "Enter Details";
                              }
                              return null;
                            },
                            maxLength: 255,
                            controller: details_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: "Details",
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              if (details == false) {
                                details = await speechToText.initialize();
                                setState(() {});
                                if (details == true) {
                                  details_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        details = true;
                                        details_t.text = result.recognizedWords;
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
                                                    details = false;
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
                                                    (details_t.text.isNotEmpty)
                                                        ? "${details_t.text}"
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
                                          details = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return details != details;
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
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 25),
                              width: 55,
                              height: 59,
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
                      hint: Text("Select Category"),
                      value: categoryvalue.isEmpty ? null : categoryvalue,
                      onChanged: (String? value) {
                        setState(() {
                          categoryvalue = value!;
                        });
                      },
                      items: [
                        for (var data in data1)
                          DropdownMenuItem<String>(
                            value: '${data["id"]}',
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${data["catrgory_name"]}",
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
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
                                return "Enter Website";
                              }
                              return null;
                            },
                            maxLength: 255,
                            controller: website_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: "Website",
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              if (website == false) {
                                website = await speechToText.initialize();
                                setState(() {});
                                if (website == true) {
                                  website_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        website = true;
                                        website_t.text = result.recognizedWords;
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
                                                    website = false;
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
                                                    (website_t.text.isNotEmpty)
                                                        ? "${website_t.text}"
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
                                          website = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return website != website;
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
                                  left: 10, right: 10, bottom: 25),
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
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Address";
                              }
                              return null;
                            },
                            maxLength: 255,
                            controller: address_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: "Address",
                              floatingLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
                                  address_t.clear();
                                  await speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        address = true;
                                        address_t.text = result.recognizedWords;
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
                                                    address = false;
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
                                                    (address_t.text.isNotEmpty)
                                                        ? "${address_t.text}"
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
                                          address = false;
                                          await speechToText.stop();
                                          Navigator.pop(context);
                                          setState(() {});
                                          return address != address;
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
                                  left: 10, right: 10, bottom: 25),
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
                          return "Enter Mobile number";
                        }
                        return null;
                      },
                      maxLength: 10,
                      controller: moblie_num_t,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        hintText: "Mobile Number",
                        floatingLabelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
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
                        "Terms and conditions",
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
                        if (_formkey.currentState!.validate()) {
                          var multipartFile =
                              await MultipartFile.fromFile(image!.path);
                          var param = new Map<String, dynamic>();
                          param['user_id'] = userid;
                          param['image'] = multipartFile;
                          param['title'] = title_t.text;
                          param['companyname'] = company_name_t.text;
                          param['district'] = select_destrict;
                          param['city'] = select_category;
                          param['price'] = price_t.text;
                          param['details'] = details_t.text;
                          param['type_category'] = categoryvalue;
                          param['website'] = website_t.text;
                          param['address'] = address_t.text;
                          param['phone_number'] = moblie_num_t.text;
                          var resdata = await apiService.postCall(
                              'advertisement/addAdvertisement', param);
                          log("${resdata}");
                          if (resdata["success"] == 1) {
                            title_t.clear();
                            company_name_t.clear();
                            price_t.clear();
                            details_t.clear();
                            website_t.clear();
                            address_t.clear();
                            moblie_num_t.clear();
                            Navigator.pop(context);
                          }
                          space = false;
                          setState(() {});
                          print("Validation Compalete");
                        } else {
                          space = true;
                          setState(() {});
                          print("Validation Faile");
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
