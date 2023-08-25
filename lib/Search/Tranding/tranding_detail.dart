import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class Tranding_Detail extends StatefulWidget {
  const Tranding_Detail({super.key});

  @override
  State<Tranding_Detail> createState() => _Tranding_DetailState();
}

class _Tranding_DetailState extends State<Tranding_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wrap(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textScaleFactor: 1.0,
                "Varachha Road",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
          width: MediaQuery.of(context).size.width,
          child: GroupButton(
            maxSelected: 1,
            options: GroupButtonOptions(
              spacing: 15,
              buttonWidth: 70,
              buttonHeight: 30,
              selectedBorderColor: Colors.brown,
              selectedColor: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(12),
              direction: Axis.horizontal,
              unselectedBorderColor: Colors.blue.shade300,
              mainGroupAlignment: MainGroupAlignment.center,
              crossGroupAlignment: CrossGroupAlignment.center,
              selectedTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
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
        Wrap(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(10)),
              height: 350,
              width: 470,
              child: Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/img_20230628.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    margin: EdgeInsets.all(14),
                    height: 230,
                    width: 430,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(
                      textScaleFactor: 1.0,
                      "video:The duration of the monsoon lies between 100 and 120 days initing from early june to mid-september",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Icon(Icons.person)),
                          ),
                          Text(
                            textScaleFactor: 1.0,
                            "By Paresh",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          Container(
                            height: 20,
                            width: 40,
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              "assets/whattsup.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            textScaleFactor: 1.0,
                            "share",
                            style: TextStyle(fontSize: 10),
                          ),
                          Container(
                            child: PopupMenuButton<String>(
                              itemBuilder: (BuildContext context) {
                                return {'Logout', 'Settings'}
                                    .map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(textScaleFactor: 1.0, choice),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: Text(
                textScaleFactor: 1.0,
                "The duration of the monsoon lies between 100 and 120 days initing from early june to mid-september",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 5, 0),
              child: Text(
                textScaleFactor: 1.0,
                "it is a long established fact that a reader will be destracted by the readable content of a page when looking at its layout. The point of using it ipsum is that it has a more-or-less normal distance of letters, as opposed",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        )
      ]),
    );
  }
}
