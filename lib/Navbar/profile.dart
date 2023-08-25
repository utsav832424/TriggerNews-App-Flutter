import 'dart:io';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trigger_news_1/Profiletab/Jobsprofile.dart';
import 'package:trigger_news_1/Profiletab/categorized.dart';
import 'package:trigger_news_1/Profiletab/localprofile.dart';
import 'package:trigger_news_1/Profiletab/newsprofile.dart';
import 'package:trigger_news_1/Profiletab/otherprofile.dart';
import 'package:trigger_news_1/Search/Tranding/other.dart';
import 'package:trigger_news_1/Wallet/wallet.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker picker = ImagePicker();
  File? image1;
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

  init() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    log("userid ${userid}");
    var resdata = await apiService.getCall('user/getuser/${1}');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
    });
  }

  uploadimage() async {
    if (image1 != null) {
      var param = new Map<String, dynamic>();
      param['image'] = await MultipartFile.fromFile(image1!.path);
      param['id'] = 1;
      var response = await apiService.postCall('user/profileimg', param);
      debugPrint(response.toString());
      if (response['success'] == 1) {
        // log('${response['data'][0]['profile_img']}');
        setState(() {
          // profile_img = response['data'][0]['profile_img'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: ListView(
          children: [
            for (var item in data1)
              Stack(
                children: [
                  Container(
                    // padding: EdgeInsets.all(100),
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      //color: Color.fromRGBO(32, 62, 160, 1),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // padding: EdgeInsets.all(100),
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Color.fromRGBO(92, 179, 255, 1),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    textScaleFactor: 1.0,
                                    "${item["username"]}",
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Wallet(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.only(
                                          top: 2, bottom: 2, right: 5, left: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Image.asset(
                                              "assets/rupees.png",
                                              height: 30,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "0.00",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    top: 65,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(92, 179, 255, 1),
                              ),
                            ),
                            Container(
                              // height: 160,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2.5, 2.0),
                                    blurRadius: 4,
                                    spreadRadius: 3,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 45),
                                        child: Text(
                                          textScaleFactor: 1.0,
                                          "${item["username"]}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(92, 179, 255, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 40),
                                        child: Image.asset(
                                          "assets/reporter.png",
                                          height: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Image.asset(
                                                "assets/send.png",
                                                height: 15,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                textScaleFactor: 1.0,
                                                "Post",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                textScaleFactor: 1.0,
                                                "10",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 0.3,
                                              color:
                                                  Colors.grey.withOpacity(0.9),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Image.asset(
                                                "assets/eyes.png",
                                                height: 20,
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                  textScaleFactor: 1.0,
                                                  "Views"),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                textScaleFactor: 1.0,
                                                "5",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 0.3,
                                              color:
                                                  Colors.grey.withOpacity(0.9),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Icon(
                                                Icons.share_outlined,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                textScaleFactor: 1.0,
                                                "Share",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                textScaleFactor: 1.0,
                                                "15",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 20,
                          right: 15,
                          left: 15,
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return GestureDetector(
                                onTap: () {
                                  showAnimatedDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        contentPadding: const EdgeInsets.all(0),
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      92, 179, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                child: Text(
                                                  textScaleFactor: 1.0,
                                                  "Choose Image",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        XFile? photo =
                                                            await picker.pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .camera);
                                                        if (photo != null) {
                                                          image1 =
                                                              File(photo.path);
                                                          uploadimage();
                                                        } else {
                                                          image1 == null;
                                                        }

                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "assets/Group1.png",
                                                            height: 100,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            textScaleFactor:
                                                                1.0,
                                                            "Pick from camera",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        XFile? photoc =
                                                            await picker.pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                        if (photoc != null) {
                                                          image1 =
                                                              File(photoc.path);
                                                          uploadimage();
                                                        } else {
                                                          image1 == null;
                                                        }

                                                        Navigator.pop(context);
                                                        setState(() {
                                                          setState(() {});
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "assets/Group2.png",
                                                            height: 100,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            textScaleFactor:
                                                                1.0,
                                                            "Pick from Gallery",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    animationType:
                                        DialogTransitionType.fadeRotate,
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                    child: (image1 != null)
                                        ? Container(
                                            padding: EdgeInsets.only(
                                                left: 93, right: 93),
                                            child: ClipOval(
                                              child: Image.file(
                                                File(image1!.path),
                                                fit: BoxFit.fill,
                                                height: 100,
                                                width: 100,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.only(
                                                left: 93, right: 93),
                                            child: ClipOval(
                                                child: item["profile_img"] !=
                                                        null
                                                    ? Image.network(
                                                        'http://144.91.124.145/~codecha/trigger_news/' +
                                                            item["profile_img"],
                                                        fit: BoxFit.fill,
                                                        height: 100,
                                                        width: 100,
                                                      )
                                                    : Container(
                                                        height: 100,
                                                        width: 100,
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                offset: Offset(
                                                                    0, 4),
                                                                spreadRadius: 0,
                                                                blurRadius: 4,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.25))
                                                          ],
                                                          shape:
                                                              BoxShape.circle,
                                                          // border: Border.all(
                                                          //     color: Color.fromRGBO(0, 0, 0, 0.25)),
                                                          color: Colors.white,
                                                        ),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: Color.fromRGBO(
                                                              92, 179, 255, 1),
                                                        ),
                                                      )),
                                          )),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 5,
                    right: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 17, right: 15),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(92, 179, 255, 1),
                        ),
                        onPressed: () async {
                          await Share.share('Hello',
                              subject: 'Look what I made!');

                          setState(() {});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                textScaleFactor: 1.0,
                                "Share Now",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
            Container(
              // margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 215, 214, 214),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorColor: Color.fromRGBO(92, 179, 255, 1),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          child: Container(
                            child: Text(
                              textScaleFactor: 1.0,
                              "News",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text(
                              textScaleFactor: 1.0,
                              "Jobs",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text(
                              textScaleFactor: 1.0,
                              "Categorized",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text(
                              textScaleFactor: 1.0,
                              "Other",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text(
                              textScaleFactor: 1.0,
                              "Local",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    child: TabBarView(
                      children: [
                        NewsProfile(),
                        JobsProfile(),
                        Categorized(),
                        OtherProfile(),
                        LocalProfile(),
                      ],
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
