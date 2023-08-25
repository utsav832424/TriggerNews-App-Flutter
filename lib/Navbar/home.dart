import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trigger_news_1/Navbar/profile.dart';
import 'package:trigger_news_1/Navbar/search.dart';
import 'package:trigger_news_1/Search/Tranding/serchtrending.dart';
import 'package:trigger_news_1/mainnews.dart';
import 'package:trigger_news_1/mainnewstext.dart';
import 'package:trigger_news_1/navbar.dart';
import 'package:trigger_news_1/newtrending.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/apiService.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;
  int likecount = 12;
  bool islike = false;
  late FlickManager flickManager;
  DateTime date = DateTime.now();
  TextEditingController comment = TextEditingController();
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

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
    var resdata = await apiService.getCall('category/getCategory');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
    });

    var resdata1 = await apiService.getCall('news/getnews?type_category=1');
    log("${resdata1}");
    setState(() {
      data2 = resdata1['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            height: 90,
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // Image.asset(
                      //   "assets/logowhite.png",
                      //   height: 50,
                      // ),
                      // SizedBox(
                      //   width: 30,
                      // ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showGeneralDialog(
                                barrierLabel: "Label",
                                barrierDismissible: true,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration: Duration(milliseconds: 700),
                                context: context,
                                pageBuilder: (context, anim1, anim2) {
                                  return StatefulBuilder(builder: (
                                    BuildContext context,
                                    setState,
                                  ) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Scaffold(
                                        backgroundColor: Colors.transparent,
                                        body: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: 50,
                                                left: 12,
                                                right: 12),
                                            // padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  239, 243, 246, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: 350,
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(20),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          92, 179, 255, 1),
                                                    ),
                                                    child: Text(
                                                      textScaleFactor: 1.0,
                                                      "Weather",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                "22",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        100),
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              child: Image.asset(
                                                                  "assets/sun.png",
                                                                  height: 80,
                                                                  width: 80),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  child: Icon(
                                                                    Icons
                                                                        .wb_sunny_outlined,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                      "Today"),
                                                                )
                                                              ],
                                                            ),
                                                            Text(
                                                              "22/14",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  child: Icon(
                                                                    Icons
                                                                        .cloud_outlined,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                      "Monday"),
                                                                )
                                                              ],
                                                            ),
                                                            Text(
                                                              "20/12",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  child: Icon(
                                                                    Icons
                                                                        .cloud_upload_rounded,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                      "Thursday"),
                                                                )
                                                              ],
                                                            ),
                                                            Text(
                                                              "19/10",
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                },
                                transitionBuilder:
                                    (context, anim1, anim2, child) {
                                  return SlideTransition(
                                    position: Tween(
                                            begin: Offset(0, 1),
                                            end: Offset(0, 0))
                                        .animate(anim1),
                                    child: child,
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              "assets/weather.png",
                              height: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/language.png",
                            height: 25,
                          ),
                        ],
                      )
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          for (var item in data1)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        serchtrending(item['id']),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    margin: EdgeInsets.only(left: 15),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 3,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      color: Color.fromRGBO(219, 224, 249, 1),
                                    ),
                                    child: Image.network(
                                      'http://144.91.124.145/~codecha/trigger_news/' +
                                          item["image"],
                                      height: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "${item["catrgory_name"]}",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 8),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Trending Now",
                    style: TextStyle(
                      color: Color.fromRGBO(92, 179, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var item in data2)
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5.0,
                                  offset: Offset(0.2, 3.0),
                                ),
                              ],
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'http://144.91.124.145/~codecha/trigger_news/' +
                                          item["image"],
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 130,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 2, bottom: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/fire.png",
                                            height: 15,
                                          ),
                                          Text(
                                            textScaleFactor: 1.0,
                                            "Trending",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "${item["headline"]}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          textScaleFactor: 1.0,
                                          "${item["username"]}",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade400,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "${item["time"]} hourse ago",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                for (var item in data2)
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Profile(),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: item["profile_img"] != null
                                              ? Image.network(
                                                  'http://144.91.124.145/~codecha/trigger_news/' +
                                                      item["profile_img"],
                                                  fit: BoxFit.cover,
                                                  width: 40,
                                                  height: 40,
                                                )
                                              : Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          offset: Offset(0, 4),
                                                          spreadRadius: 0,
                                                          blurRadius: 4,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.25))
                                                    ],
                                                    shape: BoxShape.circle,
                                                    // border: Border.all(
                                                    //     color: Color.fromRGBO(0, 0, 0, 0.25)),
                                                    color: Color.fromRGBO(
                                                        92, 179, 255, 1),
                                                  ),
                                                  child: Icon(
                                                    Icons.person,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "${item["username"]}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "Udhna",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Text(
                                            textScaleFactor: 1.0,
                                            "Subscribe",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            textScaleFactor: 1.0,
                                            "${item["time"]} hrs ago",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showGeneralDialog(
                                          barrierLabel: "Label",
                                          barrierDismissible: true,
                                          barrierColor:
                                              Colors.black.withOpacity(0.5),
                                          transitionDuration:
                                              Duration(milliseconds: 700),
                                          context: context,
                                          pageBuilder: (context, anim1, anim2) {
                                            return StatefulBuilder(builder: (
                                              BuildContext context,
                                              setState,
                                            ) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Scaffold(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  body: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 50,
                                                          left: 12,
                                                          right: 12),
                                                      // padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            239, 243, 246, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      height: 450,
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        92,
                                                                        179,
                                                                        255,
                                                                        1),
                                                              ),
                                                              child: Text(
                                                                textScaleFactor:
                                                                    1.0,
                                                                "Block the post",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              child: Text(
                                                                textScaleFactor:
                                                                    1.0,
                                                                "Please let us know why you want to report this post.",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "Offensive content",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "Disturbing scenes",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "fack news",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "Disturbing scenes",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "Disturbing scenes",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "other reasons",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20),
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  child:
                                                                      ElevatedButton(
                                                                          style: ElevatedButton
                                                                              .styleFrom(
                                                                            primary: Color.fromRGBO(
                                                                                92,
                                                                                179,
                                                                                255,
                                                                                1),
                                                                            onPrimary:
                                                                                Colors.white,
                                                                          ),
                                                                          onPressed:
                                                                              () {},
                                                                          child: Text(
                                                                              textScaleFactor: 1.0,
                                                                              "Submit")),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                          transitionBuilder:
                                              (context, anim1, anim2, child) {
                                            return SlideTransition(
                                              position: Tween(
                                                      begin: Offset(0, 1),
                                                      end: Offset(0, 0))
                                                  .animate(anim1),
                                              child: child,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.more_vert_outlined,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => mainnewstext(
                                            headline: item["headline"],
                                            news: item["news"],
                                            profile_img: item["profile_img"],
                                            username: item["username"],
                                            time: item["time"],
                                          ),
                                        ));
                                  },
                                  child: Text(
                                    textScaleFactor: 1.0,
                                    "${item["headline"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainNews(
                                            headline: item["headline"],
                                            image: item["image"],
                                            news: item["news"],
                                            profile_img: item["profile_img"],
                                            username: item["username"],
                                            time: item["time"],
                                          ),
                                        ));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'http://144.91.124.145/~codecha/trigger_news/' +
                                          item["image"],
                                      fit: BoxFit.cover,
                                      width: 450,
                                      height: 300,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        "365",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            textScaleFactor: 1.0,
                                            "${item["time"]} hours ago",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                    child: GestureDetector(
                                      onTap: () async {
                                        var data2 = new Map<String, dynamic>();
                                        data2['user_id'] = userid;
                                        data2['post_id'] = item['id'];
                                        var resData = await apiService.postCall(
                                            'userlike/addlike', data2);
                                        setState(() {
                                          item['total_like'] =
                                              resData['data'][0]['total_like'];
                                          item['user_like'] =
                                              item['user_like'] == 1 ? 0 : 1;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            item['user_like'] == 1
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            color: item['user_like'] == 1
                                                ? Colors.red
                                                : null,
                                          ),
                                          Text(
                                            item["total_like"] == null
                                                ? "0 Like"
                                                : "${item["total_like"]} Likes",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 2,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      getComments() async {
                                        var resdata = await apiService.getCall(
                                            'comments/getcomments/${item["id"]}');

                                        setState(() {
                                          data3 = resdata['data'];
                                        });
                                      }

                                      getComments();

                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child: SafeArea(
                                                  top: true,
                                                  child: Container(
                                                    height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height -
                                                        70 -
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom,
                                                    padding: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 0,
                                                          child: Text(
                                                            "Comment",
                                                            style: TextStyle(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(),
                                                        Expanded(
                                                          child:
                                                              ListView.builder(
                                                            itemCount:
                                                                data3.length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return ListTile(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(0),
                                                                leading: Container(
                                                                    padding: EdgeInsets.all(5),
                                                                    decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .grey,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: CircleAvatar(
                                                                        radius: 20,
                                                                        backgroundColor: Color.fromRGBO(92, 179, 255, 1),
                                                                        child: item['profile_img'] != null
                                                                            ? CircleAvatar(
                                                                                backgroundImage: NetworkImage(
                                                                                  'http://144.91.124.145/~codecha/trigger_news/' + item['profile_img'],
                                                                                ),
                                                                              )
                                                                            : Icon(
                                                                                Icons.person,
                                                                                color: Colors.white,
                                                                              ))),
                                                                title: Text(
                                                                    "${data3[index]["username"]}"),
                                                                subtitle: Text(
                                                                  "${data3[index]["comment"]}",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Expanded(
                                                          flex: 0,
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      comment,
                                                                  decoration: InputDecoration(
                                                                      contentPadding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              10,
                                                                          horizontal:
                                                                              10),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              5)),
                                                                      hintText:
                                                                          "Add Comment"),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  var param =
                                                                      new Map<
                                                                          String,
                                                                          dynamic>();
                                                                  param['user_id'] =
                                                                      userid;
                                                                  param['post_id'] =
                                                                      '${item["id"]}';
                                                                  param['comment'] =
                                                                      comment
                                                                          .text;
                                                                  var resdata =
                                                                      await apiService.postCall(
                                                                          'comments/addcomments',
                                                                          param);
                                                                  if (resdata[
                                                                          'success'] ==
                                                                      1) {
                                                                    comment.text =
                                                                        '';
                                                                    getComments();
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            92,
                                                                            179,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.send,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.chat_outlined,
                                          ),
                                          Text(
                                            "Comment",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 2,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      // FileDownloader.downloadFile(
                                      //   url: "assets/kaka.png",
                                      //   onProgress: (fileName, progress) {
                                      //     setState(() {});
                                      //   },
                                      //   onDownloadCompleted: (String path) {
                                      //     Fluttertoast.showToast(
                                      //       msg: "Download Successfully",
                                      //       toastLength: Toast.LENGTH_SHORT,
                                      //       textColor: Colors.white,
                                      //     );
                                      //   },
                                      //   onDownloadError: (String error) {
                                      //     Fluttertoast.showToast(
                                      //       msg: "Download Failed",
                                      //       toastLength: Toast.LENGTH_SHORT,
                                      //       textColor: Colors.white,
                                      //     );
                                      //   },
                                      // );
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.download_outlined,
                                          ),
                                          Text(
                                            "Download",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 1,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      await Share.share('Hello',
                                          subject: 'Look what I made!');

                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.share_outlined,
                                          ),
                                          Text(
                                            "Share",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 35,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: comment,
                                      keyboardType: TextInputType.none,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                        contentPadding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        hintText: "Comment",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "🔥";
                                            },
                                            child: Text(
                                              "🔥",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "🤗";
                                            },
                                            child: Text(
                                              "🤗",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "👍";
                                            },
                                            child: Text(
                                              "👍",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "😎";
                                            },
                                            child: Text(
                                              "😎",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "👌";
                                            },
                                            child: Text(
                                              "👌",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "❤";
                                            },
                                            child: Text(
                                              "❤",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "😍";
                                            },
                                            child: Text(
                                              "😍",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "😥";
                                            },
                                            child: Text(
                                              "😥",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              comment.text += "🤒";
                                            },
                                            child: Text(
                                              "🤒",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        getComments() async {
                                          var resdata = await apiService.getCall(
                                              'comments/getcomments/${item["id"]}');

                                          setState(() {
                                            data3 = resdata['data'];
                                          });
                                        }

                                        getComments();

                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: SafeArea(
                                                    top: true,
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height -
                                                          70 -
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom,
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  15),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            flex: 0,
                                                            child: Text(
                                                              "Comment",
                                                              style: TextStyle(
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                          Divider(),
                                                          Expanded(
                                                            child: ListView
                                                                .builder(
                                                              itemCount:
                                                                  data3.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return ListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  leading: Container(
                                                                      padding: EdgeInsets.all(5),
                                                                      decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .grey,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: CircleAvatar(
                                                                          radius: 20,
                                                                          backgroundColor: Color.fromRGBO(92, 179, 255, 1),
                                                                          child: item['profile_img'] != null
                                                                              ? CircleAvatar(
                                                                                  backgroundImage: NetworkImage(
                                                                                    'http://144.91.124.145/~codecha/trigger_news/' + item['profile_img'],
                                                                                  ),
                                                                                )
                                                                              : Icon(
                                                                                  Icons.person,
                                                                                  color: Colors.white,
                                                                                ))),
                                                                  title: Text(
                                                                      "${data3[index]["username"]}"),
                                                                  subtitle:
                                                                      Text(
                                                                    "${data3[index]["comment"]}",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade500,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Expanded(
                                                            flex: 0,
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        comment,
                                                                    decoration: InputDecoration(
                                                                        contentPadding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                10,
                                                                            horizontal:
                                                                                10),
                                                                        border: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                5)),
                                                                        hintText:
                                                                            "Add Comment"),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    var param =
                                                                        new Map<
                                                                            String,
                                                                            dynamic>();
                                                                    param['user_id'] =
                                                                        userid;
                                                                    param['post_id'] =
                                                                        '${item["id"]}';
                                                                    param['comment'] =
                                                                        comment
                                                                            .text;
                                                                    var resdata =
                                                                        await apiService.postCall(
                                                                            'comments/addcomments',
                                                                            param);
                                                                    if (resdata[
                                                                            'success'] ==
                                                                        1) {
                                                                      comment.text =
                                                                          '';
                                                                      getComments();
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: Color.fromRGBO(
                                                                          92,
                                                                          179,
                                                                          255,
                                                                          1),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .send,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.send,
                                          size: 20,
                                          color: Colors.blue.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 10,
                        child: Image.asset(
                          "assets/reportlable1.png",
                          height: 20,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  modelsheet() {}
}
