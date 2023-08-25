import 'package:flutter/material.dart';

class s_fitness extends StatefulWidget {
  const s_fitness({super.key});

  @override
  State<s_fitness> createState() => _s_fitnessState();
}

class _s_fitnessState extends State<s_fitness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Another thing like fitness",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                for (var item in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://th.bing.com/th/id/R.797e4ba481b7b05e44b8b749f0d1c327?rik=SokVKL5zrsefSg&riu=http%3a%2f%2fwww.factstoday.in%2fwp-content%2fuploads%2f2017%2f12%2f2.jpg&ehk=XxqlVV81nEfGpVm%2b8ou4NvuJErOKDW%2fhYm%2f75QWaQM4%3d&risl=&pid=ImgRaw&r=0",
                              fit: BoxFit.fill,
                            ),
                          ),
                          margin: EdgeInsets.all(14),
                          height: 230,
                          width: 430,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Shree ghanshyam gym",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 8, bottom: 8),
                              child: Text(
                                "₹ None",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 15),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 8, bottom: 8),
                              child: Text("01 feb 23"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),);
  }
}