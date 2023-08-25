import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_astrology.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_auto_mobile.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_electonics.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_finance.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_food.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_house.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_service.dart';
import 'package:trigger_news_1/Search/m_l_m_v_3dot.dart';
import 'package:trigger_news_1/Search/more_localmarket_view.dart';
import 'package:trigger_news_1/Search/morelocalmarket.dart';
import 'package:trigger_news_1/apiService.dart';
import 'dart:developer';

class S_Local_market extends StatefulWidget {
  const S_Local_market({super.key});

  @override
  State<S_Local_market> createState() => _S_Local_marketState();
}

class _S_Local_marketState extends State<S_Local_market> {
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
    var resdata =
        await apiService.getCall('localmarket/getlocalmarket/$userid');
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
            child: ListView(
              padding: EdgeInsets.only(top: 10),
              children: [
                // Container(
                //   margin: EdgeInsets.only(left: 10),
                //   child: Text(
                //     textScaleFactor: 1.0,
                //     "What kind of products and services are you looking for?",
                //     style: TextStyle(
                //       fontSize: 15,
                //       color: Colors.black,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // Wrap(
                //   alignment: WrapAlignment.spaceAround,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => S_Astrology(),
                //           ),
                //         );
                //       },
                //       child: Container(
                //         margin: EdgeInsets.only(left: 10),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Container(
                //               padding: EdgeInsets.all(6),
                //               margin: EdgeInsets.only(top: 20),
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                   color: const Color.fromRGBO(92, 179, 255, 1),
                //                 ),
                //                 borderRadius: BorderRadius.circular(10),
                //                 color: Colors.white,
                //               ),
                //               child: Image.asset(
                //                 "assets/weapon.png",
                //                 height: 50,
                //               ),
                //             ),
                //             Container(
                //               margin: EdgeInsets.only(top: 5),
                //               child: Text(
                //                 textScaleFactor: 1.0,
                //                 "Astrology",
                //                 style: TextStyle(
                //                   fontSize: 12,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.black,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => S_Service(),
                //           ),
                //         );
                //       },
                //       child: Container(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Container(
                //               padding: EdgeInsets.all(6),
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                   color: const Color.fromRGBO(92, 179, 255, 1),
                //                 ),
                //                 borderRadius: BorderRadius.circular(10),
                //                 color: Colors.white,
                //               ),
                //               margin: EdgeInsets.only(top: 20),
                //               child: Image.asset(
                //                 "assets/service.png",
                //                 height: 50,
                //               ),
                //             ),
                //             Container(
                //               margin: EdgeInsets.only(top: 5),
                //               child: Text(
                //                 textScaleFactor: 1.0,
                //                 "Service",
                //                 style: TextStyle(
                //                   fontSize: 12,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.black,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => S_auto_mobile(),
                //           ),
                //         );
                //       },
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Container(
                //             padding: EdgeInsets.all(6),
                //             margin: EdgeInsets.only(top: 20),
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: const Color.fromRGBO(92, 179, 255, 1),
                //               ),
                //               borderRadius: BorderRadius.circular(10),
                //               color: Colors.white,
                //             ),
                //             child: Image.asset(
                //               "assets/automobile.jpg",
                //               height: 50,
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 5),
                //             child: Text(
                //               textScaleFactor: 1.0,
                //               "Auto-Mobile",
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => s_house(),
                //           ),
                //         );
                //       },
                //       child: Column(
                //         children: [
                //           Container(
                //             padding: EdgeInsets.all(6),
                //             margin: EdgeInsets.only(top: 20),
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: const Color.fromRGBO(92, 179, 255, 1),
                //               ),
                //               borderRadius: BorderRadius.circular(10),
                //               color: Colors.white,
                //             ),
                //             child: Image.asset(
                //               "assets/house.png",
                //               height: 50,
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 5),
                //             child: Text(
                //               textScaleFactor: 1.0,
                //               "Home",
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => s_finance(),
                //             ));
                //       },
                //       child: Column(
                //         children: [
                //           Container(
                //             padding: EdgeInsets.all(6),
                //             margin: EdgeInsets.only(top: 20),
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: const Color.fromRGBO(92, 179, 255, 1),
                //               ),
                //               borderRadius: BorderRadius.circular(10),
                //               color: Colors.white,
                //             ),
                //             child: Image.asset(
                //               "assets/finance.png",
                //               height: 50,
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 5),
                //             child: Text(
                //               textScaleFactor: 1.0,
                //               "Finance",
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => s_food(),
                //             ));
                //       },
                //       child: Column(
                //         children: [
                //           Container(
                //             padding: EdgeInsets.all(6),
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: const Color.fromRGBO(92, 179, 255, 1),
                //               ),
                //               borderRadius: BorderRadius.circular(10),
                //               color: Colors.white,
                //             ),
                //             margin: EdgeInsets.only(top: 20),
                //             child: Image.asset(
                //               "assets/food.png",
                //               height: 50,
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 5),
                //             child: Text(
                //               textScaleFactor: 1.0,
                //               "Food",
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => s_electronics(),
                //             ));
                //       },
                //       child: Column(
                //         children: [
                //           Container(
                //             padding: EdgeInsets.all(6),
                //             margin: EdgeInsets.only(top: 20, right: 10),
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: const Color.fromRGBO(92, 179, 255, 1),
                //               ),
                //               borderRadius: BorderRadius.circular(10),
                //               color: Colors.white,
                //             ),
                //             child: Image.asset(
                //               "assets/Electronic.png",
                //               height: 50,
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 5, right: 10),
                //             child: Text(
                //               textScaleFactor: 1.0,
                //               "Electronic",
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Column(
                //       children: [
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => More(),
                //               ),
                //             );
                //           },
                //           child: Container(
                //             padding: EdgeInsets.all(15),
                //             margin: EdgeInsets.only(top: 20, right: 12),
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: const Color.fromRGBO(92, 179, 255, 1),
                //               ),
                //               borderRadius: BorderRadius.circular(10),
                //               color: Colors.white,
                //             ),
                //             child: Container(
                //               padding: EdgeInsets.all(5),
                //               child: Icon(
                //                 Icons.more_vert_sharp,
                //                 color: Colors.black,
                //                 size: 20,
                //               ),
                //             ),
                //           ),
                //         ),
                //         Container(
                //           margin: EdgeInsets.only(top: 5, right: 12),
                //           child: Text(
                //             textScaleFactor: 1.0,
                //             "More",
                //             style: TextStyle(
                //               fontSize: 12,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                for (var item in data1)
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            1,
                            1,
                          ),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'http://144.91.124.145/~codecha/trigger_news/' +
                                  item["image"],
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            textScaleFactor: 1.0,
                            "${item["description"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "By Paresh",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            More_localmarket_view(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 9, right: 9),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(92, 179, 255, 1),
                                      borderRadius: BorderRadius.circular(7),
                                      // border: Border.all(color: Colors.grey),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/eyes.png",
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          textScaleFactor: 1.0,
                                          "View",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 9, right: 9),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(92, 179, 255, 1),
                                    borderRadius: BorderRadius.circular(7),
                                    // border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/call.png",
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        textScaleFactor: 1.0,
                                        "Call",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => m_l_m_v_3dot(),
                                        ));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Icon(
                                      Icons.more_vert,
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
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
