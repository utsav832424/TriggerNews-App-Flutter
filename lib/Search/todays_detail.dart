import 'package:flutter/material.dart';

class Todays_detail extends StatefulWidget {
  Todays_detail({Key? key}) : super(key: key);

  @override
  State<Todays_detail> createState() => _Todays_detailState();
}

class _Todays_detailState extends State<Todays_detail> {
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
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Distric Detail..",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                for (var item in [1, 2, 3, 4, 5, 6])
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(
                            2,
                            2,
                          ),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ), //BoxShadow
                      ],
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/petrol.png",
                                    height: 70,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 190,
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        "Today's Diesel and Petrol Prices",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(92, 179, 255, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
                                            "2 hourse ago",
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
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Table(
                                // defaultColumnWidth: FixedColumnWidth(120.0),
                                border: TableBorder.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                                children: [
                                  TableRow(children: [
                                    Column(children: [
                                      Text(
                                        textScaleFactor: 1.0,
                                        'Petrol',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                    Column(children: [
                                      Text(
                                        textScaleFactor: 1.0,
                                        'Diesel',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                                  ]),
                                  TableRow(children: [
                                    Column(children: [
                                      Text(textScaleFactor: 1.0, '96.51')
                                    ]),
                                    Column(children: [
                                      Text(textScaleFactor: 1.0, '97.20')
                                    ]),
                                  ]),
                                  TableRow(children: [
                                    Column(children: [
                                      Text(textScaleFactor: 1.0, '92.25')
                                    ]),
                                    Column(children: [
                                      Text(textScaleFactor: 1.0, '96.52')
                                    ]),
                                  ]),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Source: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                'https://wwww.goodreturns.in/',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: 300,
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Note: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                'These are statewide prices. Prices may vary in different shops at district level.',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.mode_comment_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          textScaleFactor: 1.0,
                                          "250",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      textScaleFactor: 1.0,
                                      "Comment",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.share,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          textScaleFactor: 1.0,
                                          "4707",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      textScaleFactor: 1.0,
                                      "Share",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
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
        ],
      ),
    );
  }
}
