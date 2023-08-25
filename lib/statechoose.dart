import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:trigger_news_1/selocation.dart';

class statechoose extends StatefulWidget {
  const statechoose({super.key});

  @override
  State<statechoose> createState() => _statechooseState();
}

class _statechooseState extends State<statechoose> {
  // final data = [
  //   {
  //     'name': 'GUJRAT',
  //     'img': "assets/gujrat.png",
  //   },
  //   {
  //     'name': 'ANDHRA PRADESH',
  //     'img': "assets/andhra.png",
  //   },
  //   {
  //     'name': 'ASAM',
  //     'img': "assets/asam.png",
  //   },
  //   {
  //     'name': 'GOA',
  //     'img': "assets/goa.png",
  //   },
  //   {'name': 'KERLA', 'img': "assets/kerala.png"}
  // ];

  late SharedPreferences pref;
  ApiService apiService = ApiService();
  var userid;

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
    log("userid : ${userid.toString()}");
    var resdata = await apiService.getCall('state/getstate');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 5, left: 20),
                  child: Image.asset(
                    'assets/logo black.png',
                    height: 90,
                    width: 90,
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 20),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Choose your state",
                    style: TextStyle(
                        color: Color(
                          0xff090909,
                        ),
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ...List.generate(data1.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Selocation(stateid: data1[index]["id"]),
                          ));
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'http://144.91.124.145/~codecha/trigger_news/' +
                                  data1[index]["image"].toString(),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff333333).withOpacity(0.0),
                                      Color(0xff000000).withOpacity(0.6),
                                    ]),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Positioned(
                            child: Text(
                          textScaleFactor: 1.0,
                          "${data1[index]["name"]}",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ))
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
