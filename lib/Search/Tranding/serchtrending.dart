import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:trigger_news_1/mainnews.dart';
import 'package:trigger_news_1/video_player_tranding.dart';

class serchtrending extends StatefulWidget {
  int? c_index;

  serchtrending([this.c_index]);

  @override
  State<serchtrending> createState() => _serchtrendingState();
}

class _serchtrendingState extends State<serchtrending> {
  ApiService apiService = ApiService();
  late SharedPreferences pref;
  var userid;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    init1(widget.c_index!);
  }

  List data1 = [];
  List data2 = [];

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

  init1(int index) async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    var resdata =
        await apiService.getCall('news/getnews?type_category=${index}');
    log("${resdata}");
    setState(() {
      data2 = resdata['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data1.length,
      initialIndex: widget.c_index! - 1,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                textScaleFactor: 1.0,
                "News of all place..",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TabBar(
                isScrollable: true,
                // indicatorPadding: EdgeInsets.only(left: 0, right: 30),
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(92, 179, 255, 1)),
                onTap: (value) async {
                  widget.c_index = value + 1.toInt();
                  init1(value + 1);
                  print(widget.c_index);
                  // for (int i = 1; i <= data2.length; i++) {
                  //   if (widget.c_index.toString() == data2[i]["user_id"]) {
                  //     setState(() {
                  //       data3.add(data2[i]);
                  //     });
                  //   }
                  // }
                  // print(data3);
                },
                tabs: [
                  ...List.generate(
                    data1.length,
                    (index) => Tab(
                      text: "${data1[index]["catrgory_name"]}",
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  for (var item in data2)
                    Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                                        builder: (context) =>
                                            video_player_tranding(),
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                              "http://144.91.124.145/~codecha/trigger_news/" +
                                                  item["image"]),
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
                                                  top: 5,
                                                  left: 5,
                                                  right: 5,
                                                  bottom: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.black),
                                              child: Text(
                                                textScaleFactor: 1.0,
                                                "01:25:20",
                                                style: TextStyle(
                                                    color: Colors.white),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.person,
                                            color:
                                                Color.fromRGBO(79, 79, 79, 1)),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          textScaleFactor: 1.0,
                                          "By Sahil",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  79, 79, 79, 1)),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 8,
                                            bottom: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                            color:
                                                Color.fromRGBO(79, 79, 79, 1)),
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
                            margin: EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Icon(Icons.person,
                                              color: Color.fromRGBO(
                                                  79, 79, 79, 1)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            textScaleFactor: 1.0,
                                            "By Sahil",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    79, 79, 79, 1)),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 8,
                                              bottom: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                              color: Color.fromRGBO(
                                                  79, 79, 79, 1)),
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
              // TabBarView(
              //   children: [
              //     // Trending(),
              //     // Entertainment(),
              //     // Viral_content(),
              //     // goverment_scheme(),
              //     // Job(),
              //     // Politics(),
              //     // Technology(),
              //     // Religious_devotion(),
              //     // Education(),
              //     // Farming(),
              //     // Interesting_things(),
              //     // Sports(),
              //     // Business(),
              //     // The_Weather(),
              //     // Other(),
              //     // current_affairs(),
              //     // life_style(),
              //     // Crime(),
              //     // Almanac(),
              //     // Horoscope(),
              //     // whatsaap_status(),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
