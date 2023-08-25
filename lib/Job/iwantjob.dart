import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:group_button/group_button.dart';
import 'package:trigger_news_1/Create/job.dart';
import 'package:trigger_news_1/Job/iwantjobdetail.dart';
import 'package:trigger_news_1/Job/myjob.dart';
import 'package:trigger_news_1/Job/myprofile.dart';

class Iwantjob extends StatefulWidget {
  Iwantjob({Key? key}) : super(key: key);

  @override
  State<Iwantjob> createState() => _IwantjobState();
}

class _IwantjobState extends State<Iwantjob> {
  List state = [];
  String statechoose = '';
  GroupButtonController controller = GroupButtonController();
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
              margin: EdgeInsets.only(left: 15, right: 15),
              child: ListView(
                padding: EdgeInsets.only(top: 5),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          textScaleFactor: 1.0,
                          "Jobs",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Job(),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(92, 179, 255, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromRGBO(92, 179, 255, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  textScaleFactor: 1.0,
                                  "Create Post",
                                  style: TextStyle(
                                    fontSize: 10,
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
                    margin: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(168, 168, 168, 1),
                            width: 0.2)),
                  ),
                  Container(
                    child: GroupButton(
                      enableDeselect: true,
                      controller: controller,
                      options: GroupButtonOptions(
                        borderRadius: BorderRadius.circular(8),
                        buttonWidth: 155,
                        unselectedTextStyle:
                            TextStyle(color: Color.fromRGBO(140, 140, 140, 1)),
                        selectedColor: Color.fromRGBO(92, 179, 255, 1),
                        // unselectedColor: Colors.white,
                        unselectedBorderColor: Color.fromRGBO(92, 179, 255, 1),
                        selectedBorderColor: Colors.transparent,
                      ),
                      buttons: [
                        'My Profile',
                        'My Job',
                      ],
                      onSelected: (value, index, isSelected) {
                        setState(() {
                          log("${value} , ${index} , ${isSelected}");
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyProfile(),
                                ));
                          }
                          if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Myjob(),
                                ));
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(168, 168, 168, 1),
                            width: 0.2)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color.fromRGBO(92, 179, 255, 1),
                                  )),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                        textScaleFactor: 1.0, "Type of jobs"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromRGBO(92, 179, 255, 1),
                                )),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                      textScaleFactor: 1.0, "Qualification"),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromRGBO(92, 179, 255, 1),
                                )),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(textScaleFactor: 1.0, "Salary"),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
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
                          builder: (context) => Iwantjobdetail(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ...List.generate(
                            4,
                            (index) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/rbi.png",
                                        height: 180,
                                        width: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 0,
                                    top: 2,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromRGBO(0, 0, 0, 0),
                                                Color.fromRGBO(0, 0, 0, 0.6),
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Positioned(
                                    left: 5,
                                    right: 5,
                                    child: Container(
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        "Banking Legal Insurance",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 5,
                                    right: 5,
                                    bottom: 42,
                                    child: Container(
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        "(Recruitment to the posts in Rbi)",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 5,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.asset(
                                        "assets/king.png",
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 5,
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "3.2",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 5,
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(92, 179, 255, 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 4),
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "View More",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 13,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
