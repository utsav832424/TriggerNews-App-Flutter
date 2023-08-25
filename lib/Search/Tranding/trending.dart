import 'package:flutter/material.dart';
import 'package:trigger_news_1/Navbar/profile.dart';
import 'package:trigger_news_1/Search/Tranding/tranding_detail.dart';
import 'package:trigger_news_1/mainnews.dart';
import 'package:trigger_news_1/video_player_tranding.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  bool isChecked = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // margin: EdgeInsets.only(left: 10, right: 10),
      body: ListView(
        children: [
          for (var item in [1, 2, 3, 4])
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(1, 1),
                          spreadRadius: 0,
                          blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => video_player_tranding(),
                              ));
                        },
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset('assets/image 13.png'),
                                ),
                                Positioned(
                                  child: Image.asset(
                                    "assets/player.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 5, left: 5, right: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black),
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        "01:25:20",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text(
                                textScaleFactor: 1.0,
                                "Video: The duration of the monsoon lies between 100 and 120 days initiating from early June to mid-September",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Icon(Icons.person,
                                    color: Color.fromRGBO(79, 79, 79, 1)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Text(
                                  textScaleFactor: 1.0,
                                  "By Sahil",
                                  style: TextStyle(
                                      color: Color.fromRGBO(79, 79, 79, 1)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(182, 181, 181, 1))),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/14.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        "Share",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(79, 79, 79, 1)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Icon(Icons.more_vert,
                                    color: Color.fromRGBO(79, 79, 79, 1)),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainNews(),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                            blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset('assets/kaka.png'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text(
                                textScaleFactor: 1.0,
                                "Video: The duration of the monsoon lies between 100 and 120 days initiating from early June to mid-September",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Icon(Icons.person,
                                      color: Color.fromRGBO(79, 79, 79, 1)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    textScaleFactor: 1.0,
                                    "By Sahil",
                                    style: TextStyle(
                                        color: Color.fromRGBO(79, 79, 79, 1)),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              182, 181, 181, 1))),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/14.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          textScaleFactor: 1.0,
                                          "Share",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  79, 79, 79, 1)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Icon(Icons.more_vert,
                                      color: Color.fromRGBO(79, 79, 79, 1)),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
