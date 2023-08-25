import 'dart:io';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:video_player/video_player.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isSwitched = false;
  SpeechToText speechToText = SpeechToText();
  bool event_name = false;
  TextEditingController headline_name_t = TextEditingController();
  bool manager = false;
  TextEditingController news_t = TextEditingController();
  bool place = false;
  TextEditingController c_n_place_t = TextEditingController();
  bool highlights = false;
  TextEditingController additonal_info_t = TextEditingController();
  TextEditingController when_t = TextEditingController();
  PlatformFile? file;
  late VideoPlayerController _controller;
  String select_category = '';
  final _formKey = GlobalKey<FormState>();
  bool space = false;

  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

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

  List data1 = [];
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
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.only(top: 5),
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        textScaleFactor: 1.0,
                        "Upload Post",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(92, 179, 255, 1),
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
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
                            margin: EdgeInsets.only(top: 10),
                            decoration: (file == null)
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.2)))
                                : null,
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
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cloud_upload,
                                        color: Color.fromRGBO(233, 236, 255, 1),
                                        size: 60,
                                      ),
                                      Text(
                                        textScaleFactor: 1.0,
                                        "Upload Photo and Video",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                174, 183, 235, 1)),
                                      )
                                    ],
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Add a headline';
                              }
                            },
                            controller: headline_name_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: 'Add a headline',
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
                                if (event_name == false) {
                                  event_name = await speechToText.initialize();
                                  setState(() {});
                                  if (event_name == true) {
                                    headline_name_t.clear();
                                    await speechToText.listen(
                                      onResult: (result) {
                                        setState(() {
                                          event_name = true;
                                          headline_name_t.text =
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
                                                        color: Colors
                                                            .grey.shade700,
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
                                                          shape:
                                                              BoxShape.circle),
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
                                                              color: Colors.blue
                                                                  .shade800,
                                                              shape: BoxShape
                                                                  .circle),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_voice,
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
                                                      (headline_name_t
                                                              .text.isNotEmpty)
                                                          ? "${headline_name_t.text}"
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
                                margin: EdgeInsets.only(
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
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter News';
                              }
                              return null;
                            },
                            controller: news_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: 'News',
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
                                if (manager == false) {
                                  manager = await speechToText.initialize();
                                  setState(() {});
                                  if (manager == true) {
                                    news_t.clear();
                                    await speechToText.listen(
                                      onResult: (result) {
                                        setState(() {
                                          manager = true;
                                          news_t.text = result.recognizedWords;
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
                                                        color: Colors
                                                            .grey.shade700,
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
                                                          shape:
                                                              BoxShape.circle),
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
                                                              color: Colors.blue
                                                                  .shade800,
                                                              shape: BoxShape
                                                                  .circle),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_voice,
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
                                                      (news_t.text.isNotEmpty)
                                                          ? "${news_t.text}"
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
                                margin: EdgeInsets.only(
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
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextFormField(
                    //         validator: (value) {
                    //           if (value == null || value.isEmpty) {
                    //             return 'Enter Date';
                    //           }
                    //           return null;
                    //         },
                    //         decoration: InputDecoration(
                    //           border: OutlineInputBorder(),
                    //           hintText: 'Date',
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //       child: TextFormField(
                    //         validator: (value) {
                    //           if (value == null || value.isEmpty) {
                    //             return 'Enter Time';
                    //           }
                    //           return null;
                    //         },
                    //         decoration: InputDecoration(
                    //           border: OutlineInputBorder(),
                    //           hintText: 'Time',
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Constituency / news place";
                              }
                              return null;
                            },
                            controller: c_n_place_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: 'Constituency / news place',
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
                                if (place == false) {
                                  place = await speechToText.initialize();
                                  setState(() {});
                                  if (place == true) {
                                    c_n_place_t.clear();
                                    await speechToText.listen(
                                      onResult: (result) {
                                        setState(() {
                                          place = true;
                                          c_n_place_t.text =
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
                                                        color: Colors
                                                            .grey.shade700,
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
                                                          shape:
                                                              BoxShape.circle),
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
                                                              color: Colors.blue
                                                                  .shade800,
                                                              shape: BoxShape
                                                                  .circle),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_voice,
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
                                                      (c_n_place_t
                                                              .text.isNotEmpty)
                                                          ? "${c_n_place_t.text}"
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
                                margin: EdgeInsets.only(
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
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter when";
                          }
                          return null;
                        },
                        controller: when_t,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          hintText: 'when',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Additional Information";
                              }
                              return null;
                            },
                            controller: additonal_info_t,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              hintText: 'Additional Information',
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
                                if (highlights == false) {
                                  highlights = await speechToText.initialize();
                                  setState(() {});
                                  if (highlights == true) {
                                    additonal_info_t.clear();
                                    await speechToText.listen(
                                      onResult: (result) {
                                        setState(() {
                                          highlights = true;
                                          additonal_info_t.text =
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
                                                        color: Colors
                                                            .grey.shade700,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      highlights = false;
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
                                                          shape:
                                                              BoxShape.circle),
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
                                                              color: Colors.blue
                                                                  .shade800,
                                                              shape: BoxShape
                                                                  .circle),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_voice,
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
                                                      (additonal_info_t
                                                              .text.isNotEmpty)
                                                          ? "${additonal_info_t.text}"
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
                                            highlights = false;
                                            await speechToText.stop();
                                            Navigator.pop(context);
                                            setState(() {});
                                            return highlights != highlights;
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
                      height: 10,
                    ),
                    Container(
                      height: 59,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blue)),
                      child: DropdownButtonFormField<String>(
                        // alignment: Alignment.center,
                        isExpanded: true,
                        hint: Text("Select Category"),
                        value: select_category.isEmpty ? null : select_category,
                        onChanged: (String? value) {
                          setState(() {
                            select_category = value!;
                            log("${select_category}");
                          });
                        },
                        items: [
                          for (var data in data1)
                            DropdownMenuItem<String>(
                              value: '${data['id']}',
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${data['catrgory_name']}",
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            textScaleFactor: 1.0,
                            "Post anonymously",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.blue,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey[150],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            textScaleFactor: 1.0,
                            "Get credit for the news",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(92, 179, 255, 1),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var multipartFile =
                                await MultipartFile.fromFile(image!.path);
                            var param = new Map<String, dynamic>();
                            param['user_id'] = userid;
                            param['image'] = multipartFile;
                            param['headline'] = headline_name_t.text;
                            param['news'] = news_t.text;
                            param['newplace'] = c_n_place_t.text;
                            param['when1'] = when_t.text;
                            param['information'] = additonal_info_t.text;
                            param['type_category'] = select_category;
                            var resdata = await apiService.postCall(
                                'news/addnews', param);
                            log("${resdata}");
                            if (resdata["success"] == 1) {
                              headline_name_t.clear();
                              news_t.clear();
                              c_n_place_t.clear();
                              when_t.clear();
                              additonal_info_t.clear();
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
          ),
        ],
      ),
    );
  }
}
