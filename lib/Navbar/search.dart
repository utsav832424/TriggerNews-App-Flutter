import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/Create/realestate.dart';
import 'package:trigger_news_1/Job/iwantjob.dart';
import 'package:trigger_news_1/Search/Greetings.dart';
import 'package:trigger_news_1/Search/S_local_market.dart';
import 'package:trigger_news_1/Search/mrg.dart';
import 'package:trigger_news_1/Search/realstate.dart';
import "dart:developer";
import 'package:trigger_news_1/Search/todays_detail.dart';
import 'package:trigger_news_1/Search/area.dart';
import 'package:trigger_news_1/Search/Tranding/serchtrending.dart';
import 'package:trigger_news_1/apiService.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool temp = false;
  List<Color> color = [
    Colors.blue,
    Colors.yellow,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );
    _controller.animateBack(1);
    // temp = true;
    // if (temp == true) {
    //   _controller.stop();
    // }
  }

  ApiService apiService = ApiService();
  late SharedPreferences pref;
  List data1 = [];
  var userid;
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
                      Image.asset(
                        "assets/language.png",
                        height: 25,
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
              padding: EdgeInsets.only(top: 5),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Text(
                        textScaleFactor: 1.0,
                        "news from everywhere...",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...List.generate(data1.length, (index) {
                        return SlideTransition(
                          position: _animation,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        serchtrending(index + 1),
                                  ));
                            },
                            child: Container(
                              height: 150,
                              width: 100,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade100,
                                border: Border.all(color: Colors.blue),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 5.0,
                                    offset: Offset(0.2, 2.0),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.trending_up),
                                  // Image.network(
                                  //   'http://144.91.124.145/~codecha/trigger_news/' +
                                  //       data1[index]["image"],
                                  // height: 40,
                                  // width: 40,
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    textScaleFactor: 1.0,
                                    "${data1[index]["catrgory_name"]}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Text(
                        textScaleFactor: 1.0,
                        "From Your Area...",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Area(),
                            ),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade100,
                            border: Border.all(color: Colors.blue),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: Offset(0.2, 2.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      // border: Border.all(
                                      //     color: Colors.blue.shade900),
                                    ),
                                    child: Image.asset('assets/road 1.png'),
                                    height: 100,
                                    width: 100,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "Varachha road surat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Todays_detail(),
                              ));
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lime.shade100,
                            border: Border.all(color: Colors.lime.shade700),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: Offset(0.2, 2.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      // border: Border.all(
                                      //     color: Colors.blue.shade900),
                                    ),
                                    child: Image.asset('assets/home 3.png'),
                                    height: 100,
                                    width: 100,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "Today's Detail",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Iwantjob(),
                              ));
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.brown.shade100,
                            border: Border.all(color: Colors.brown),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: Offset(0.2, 2.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      // border: Border.all(
                                      //     color: Colors.blue.shade900),
                                    ),
                                    child: Image.asset('assets/bag.png'),
                                    height: 80,
                                    width: 100,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "Job",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => Mrg(),
                      //         ));
                      //   },
                      //   child: Container(
                      //     width: 160,
                      //     height: 160,
                      //     margin: EdgeInsets.all(5),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.red.shade100,
                      //       border: Border.all(color: Colors.red),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.black.withOpacity(0.3),
                      //           blurRadius: 5.0,
                      //           offset: Offset(0.2, 2.0),
                      //         ),
                      //       ],
                      //     ),
                      //     alignment: Alignment.center,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Column(
                      //           children: [
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                 shape: BoxShape.circle,
                      //                 color: Colors.white,
                      //                 // border: Border.all(
                      //                 //     color: Colors.blue.shade900),
                      //               ),
                      //               child: Image.asset('assets/mrg.png'),
                      //               height: 100,
                      //               width: 90,
                      //             ),
                      //             Container(
                      //               margin: EdgeInsets.only(top: 10),
                      //               child: Text(
                      //                 textScaleFactor: 1.0,
                      //                 "Marriage",
                      //                 style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 12),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => realstate1(),
                              ));
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.indigo.shade100,
                            border: Border.all(color: Colors.indigo),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: Offset(0.2, 2.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      // border: Border.all(
                                      //     color: Colors.blue.shade900),
                                    ),
                                    child: Image.asset('assets/realstate.png'),
                                    height: 100,
                                    width: 90,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "Realstate",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => greeting(),
                            ),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey.shade100,
                            border: Border.all(color: Colors.blueGrey),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: Offset(0.2, 2.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      // border: Border.all(
                                      //     color: Colors.blue.shade900),
                                    ),
                                    child: Image.asset('assets/greetings.png'),
                                    height: 100,
                                    width: 90,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "Greetings",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => S_Local_market(),
                            ),
                          );
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.yellow.shade100,
                            border: Border.all(color: Colors.yellow.shade700),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: Offset(0.2, 2.0),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      // border: Border.all(
                                      //     color: Colors.blue.shade900),
                                    ),
                                    child:
                                        Image.asset('assets/localmarket.png'),
                                    height: 100,
                                    width: 90,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "Local Market",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
