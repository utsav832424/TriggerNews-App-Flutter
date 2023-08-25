import 'package:flutter/material.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_astrology.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_auto_mobile.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_beautyandwellbeing.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_covid.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_cunstruction.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_device.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_electonics.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_farmer.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_fashion.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_finance.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_food.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_giftandtoys.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_house.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_learn.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_logistics.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_petanimal.dart';
import 'package:trigger_news_1/S_Local_market_detail/s_service.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => S_Astrology(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(left: 10, top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/weapon.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Astrology",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => S_Service(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "assets/service.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Service",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => S_auto_mobile(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/automobile.jpg",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Auto-Mobile",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_finance(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin:
                                EdgeInsets.only(left: 0, top: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/finance.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, right: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Finance",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => s_food(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(left: 10, top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/food.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Food",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_house(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "assets/house.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Home",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_electronics(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/Electronic.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Electronic",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_learn(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin:
                                EdgeInsets.only(left: 0, top: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/learn.jpg",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, right: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Learn",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => s_logistics(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(left: 10, top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/logistic.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Logistic",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_farmer(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "assets/Agriculture.jpg",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Agriculture",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_fashion(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/fashion.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Fashion",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                                builder: (context) => s_construction()));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(left: 0, top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/construction.png",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, right: 2),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Construction",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => s_device(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(left: 10, top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/devices.jpg",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Devices",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_beautyandwellbeing(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(left: 10, top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/Beauty.jpg",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Beauty",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_giftsanddtoys(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(left: 10, top: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/toys.jpg",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Toys",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
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
                              builder: (context) => s_petanimal(),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            margin:
                                EdgeInsets.only(left: 10, top: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(92, 179, 255, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/animals.jpg",
                              height: 50,
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 15, left: 10, right: 10),
                            child: Text(
                              textScaleFactor: 1.0,
                              "Animals",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => s_covid(),
                        ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.only(left: 10, top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(92, 179, 255, 1),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          "assets/covid.jpg",
                          height: 50,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 20),
                        child: Text(
                          textScaleFactor: 1.0,
                          "Covid",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
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
