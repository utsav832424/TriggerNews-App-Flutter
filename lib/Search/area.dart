import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class Area extends StatefulWidget {
  const Area({super.key});

  @override
  State<Area> createState() => _AreaState();
}

class _AreaState extends State<Area> {
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
              padding: EdgeInsets.only(top: 5),
              children: [
                Wrap(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textScaleFactor: 1.0,
                          "Varachha Road",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            textScaleFactor: 1.0,
                            "video:The duration of the monsoon lies between 100 and 120 days initing from early june to mid-september"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    child: GroupButton(
                      maxSelected: 1,
                      options: GroupButtonOptions(
                        spacing: 20,
                        buttonWidth: 90,
                        buttonHeight: 40,
                        selectedBorderColor: Colors.brown,
                        selectedColor: Color.fromRGBO(92, 179, 255, 1),
                        borderRadius: BorderRadius.circular(12),
                        direction: Axis.horizontal,
                        unselectedTextStyle: TextStyle(color: Colors.grey),
                        unselectedBorderColor: Color(0xFF5CB3FF),
                        mainGroupAlignment: MainGroupAlignment.center,
                        crossGroupAlignment: CrossGroupAlignment.center,
                        selectedTextStyle: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          // fontSize: 8,
                        ),
                        groupingType: GroupingType.wrap,
                      ),
                      buttons: [
                        "Udhna",
                        "Olpad",
                        "Katargam",
                        "Karanj",
                        "Kamrej",
                        "Choryasi",
                        "Bardoli",
                        "Majura",
                        "Mahuva",
                        "Mangrola",
                        "Bardoli",
                        "Majura"
                      ],
                    ),
                  ),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/image 13.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            textScaleFactor: 1.0,
                            "video:The duration of the monsoon lies between 100 and 120 days initing from early june to mid-september.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 9, right: 9),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/whattsup.png",
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        textScaleFactor: 1.0,
                                        "Share",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: Text(
                      textScaleFactor: 1.0,
                      "The duration of the monsoon lies between 100 and 120 days initing from early june to mid-september",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 5, 0),
                    child: Text(
                      textScaleFactor: 1.0,
                      "it is a long established fact that a reader will be destracted by the readable content of a page when looking at its layout. The point of using it ipsum is that it has a more-or-less normal distance of letters, as opposed",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
