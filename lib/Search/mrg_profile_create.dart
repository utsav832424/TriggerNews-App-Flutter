import 'package:flutter/material.dart';

class mrg_profile_create extends StatefulWidget {
  mrg_profile_create({Key? key}) : super(key: key);

  @override
  State<mrg_profile_create> createState() => _mrg_profile_createState();
}

class _mrg_profile_createState extends State<mrg_profile_create> {
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
              // toolbarHeight: 50,
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
                  children: [
                    Icon(
                      Icons.person,
                      color: Color.fromRGBO(92, 179, 255, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      textScaleFactor: 1.0,
                      "Please provide your basic details",
                    ),
                  ],
                ),
                Column()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
