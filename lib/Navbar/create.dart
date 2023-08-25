import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trigger_news_1/Create/Events.dart';
import 'package:trigger_news_1/Create/Shorts1.dart';
import 'package:trigger_news_1/Create/aboutyourvillage.dart';
import 'package:trigger_news_1/Create/advertisement.dart';
import 'package:trigger_news_1/Create/feedback.dart';
import 'package:trigger_news_1/Create/goodluck.dart';
import 'package:trigger_news_1/Create/job.dart';
import 'package:trigger_news_1/Create/localmarket.dart';
import 'package:trigger_news_1/Create/realestate.dart';
import 'package:trigger_news_1/Create/news.dart';

class Create extends StatefulWidget {
  Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  List data = [
    {
      'id': 1,
      'name': 'News',
      'img': 'assets/mic.png',
    },
    {
      'id': 2,
      'name': 'Job',
      'img': 'assets/bag.png',
    },
    {
      'id': 3,
      'name': 'Good Luck',
      'img': 'assets/gift.png',
    },
    {
      'id': 4,
      'name': 'Advertisement',
      'img': 'assets/admic.png',
    },
    {
      'id': 5,
      'name': 'Local Market',
      'img': 'assets/lari.png',
    },
    {
      'id': 6,
      'name': 'Real Estate',
      'img': 'assets/reale.png',
    },
    {
      'id': 7,
      'name': 'feedback',
      'img': 'assets/feedback.png',
    },
    {
      'id': 8,
      'name': 'About Your\nVillage',
      'img': 'assets/garden.png',
    },
    {
      'id': 9,
      'name': 'Events',
      'img': 'assets/events.png',
    },
    {
      'id': 10,
      'name': 'Shorts',
      'img': 'assets/shorts.png',
    },
  ];
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
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                padding: EdgeInsets.only(top: 5),
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      textScaleFactor: 1.0,
                      "Upload",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(92, 179, 255, 1),
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        textScaleFactor: 1.0,
                        "Select the type of submission",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      ...List.generate(data.length, (index) {
                        return Wrap(
                          children: [
                            GestureDetector(
                              onTap: () {
                                log("${data[index]['id']}");
                                if (data[index]['id'] == 1) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => News(),
                                      ));
                                }
                                if (data[index]['id'] == 2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Job(),
                                      ));
                                }
                                if (data[index]['id'] == 3) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Good_Luck(),
                                      ));
                                }
                                if (data[index]['id'] == 4) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => advertisement(),
                                      ));
                                }
                                if (data[index]['id'] == 5) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => localmarket(),
                                      ));
                                }
                                if (data[index]['id'] == 6) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => realestate(),
                                      ));
                                }
                                if (data[index]['id'] == 7) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Feedback1(),
                                      ));
                                }
                                if (data[index]['id'] == 8) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Aboutyourvillage(),
                                      ));
                                }
                                if (data[index]['id'] == 9) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Events(),
                                      ));
                                }
                                if (data[index]['id'] == 10) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Shorts1(),
                                      ));
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromRGBO(
                                                215, 221, 255, 1)),
                                      ),
                                      Positioned(
                                          right: 0,
                                          left: 0,
                                          bottom: 10,
                                          child: Image.asset(
                                            '${data[index]['img']}',
                                            height: 60,
                                          ))
                                    ],
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "${data[index]["name"]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(92, 179, 255, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      })
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
