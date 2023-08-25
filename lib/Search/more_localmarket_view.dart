import 'package:flutter/material.dart';
import 'package:trigger_news_1/Search/m_l_m_v_3dot.dart';

class More_localmarket_view extends StatefulWidget {
  More_localmarket_view({Key? key}) : super(key: key);

  @override
  State<More_localmarket_view> createState() => _More_localmarket_viewState();
}

class _More_localmarket_viewState extends State<More_localmarket_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90,
            child: AppBar(
              // automaticallyImplyLeading: false,
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
                      Image.asset(
                        "assets/logowhite.png",
                        height: 50,
                      ),
                      SizedBox(
                        width: 30,
                      ),
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
              children: [
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
                                onTap: () {},
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
