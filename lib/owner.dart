import 'dart:io';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:trigger_news_1/Job/owner1.dart';
import 'package:trigger_news_1/Job/owner2.dart';

class Owner extends StatefulWidget {
  const Owner({super.key});

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  int selectedRadioTile = 0;
  int selectedRadioTile1 = 0;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController job_title = TextEditingController();
  TextEditingController number_0f_opening = TextEditingController();

  TextEditingController minimum = TextEditingController();
  TextEditingController maximum = TextEditingController();
  int drop = 0;
  int drop1 = 0;
  int drop2 = 0;
  int city_town_locality = 0;
  late GroupButtonController gbutton;
  int? g_button;

  @override
  void initState() {
    super.initState();
    gbutton = GroupButtonController();
    selectedRadioTile = 0;
    selectedRadioTile1 = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedRadioTile1(int val) {
    setState(() {
      selectedRadioTile1 = val;
    });
  }

  var _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
                    // Image.asset(
                    //   "assets/logowhite.png",
                    //   height: 50,
                    // ),
                    // SizedBox(
                    //   width: 30,
                    // ),
                    // Image.asset(
                    //   "assets/language.png",
                    //   height: 25,
                    // )
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
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Text(
                      textScaleFactor: 1.0,
                      "Upload Job",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(92, 179, 255, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 14,
                  ),
                  width: 360,
                  child: RawMaterialButton(
                    fillColor: Colors.blue.shade100,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate,
                          color: Colors.amber,
                          size: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          textScaleFactor: 1.0,
                          "Your first job post on lokal is freel!",
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17, top: 10),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Job Details",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Tall us Little about the job",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 14,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter job title";
                      }
                      return null;
                    },
                    controller: job_title,
                    cursorColor: Colors.grey,
                    maxLength: 120,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Job Title',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 17, right: 14, top: 10),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hint: Text(
                      textScaleFactor: 1.0,
                      "Job Category",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "Flutter"),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "Web"),
                        ),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "android"),
                        ),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      drop = value!;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 17, right: 14, top: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Number of openings";
                      }
                      return null;
                    },
                    controller: number_0f_opening,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Number of Openings',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17, top: 10, bottom: 20),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Job Type",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  child: GroupButton(
                    controller: gbutton,
                    options: GroupButtonOptions(
                      spacing: 20,
                      buttonWidth: 150,
                      buttonHeight: 40,
                      selectedBorderColor: Colors.grey,
                      selectedColor: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                      unselectedBorderColor: Colors.blue,
                      groupingType: GroupingType.wrap,
                    ),
                    onSelected: (value, index, isSelected) {
                      setState(() {
                        g_button = index;
                        print("${g_button}");
                      });
                    },
                    buttons: [
                      "Field Job",
                      "Office Job",
                      "Work From Home",
                      "Udhna",
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Job Location",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 14,
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hint: Text(
                      textScaleFactor: 1.0,
                      "District",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "gujrat"),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "Pune"),
                        ),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "Banglor"),
                        ),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      drop1 = value!;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 14,
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hint: Text(
                      textScaleFactor: 1.0,
                      "City",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "Surat"),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "Ahmdabad"),
                        ),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "Vadodara"),
                        ),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      city_town_locality = value!;
                      setState(() {});
                    },
                  ),
                ),
                // Container(
                //   height: 70,
                //   margin: EdgeInsets.only(
                //     left: 17,
                //     right: 14,
                //   ),
                //   child: TextFormField(
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Enter City/Town/Locality";
                //       }
                //       return null;
                //     },
                //     controller: city_town_locality,
                //     maxLength: 80,
                //     decoration: InputDecoration(
                //       contentPadding: EdgeInsets.all(10),
                //       border: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.black,
                //         ),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.grey,
                //         ),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       hintText: 'City/Town/Locality',
                //       hintStyle: TextStyle(
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(left: 17, top: 10, bottom: 10),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Where are you interested in hiring from?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 14,
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hint: Text(
                      textScaleFactor: 1.0,
                      "Candidates preferred from",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "In District"),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Text(textScaleFactor: 1.0, "In state"),
                        ),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Text(
                              textScaleFactor: 1.0,
                              "Select Multiple Districts"),
                        ),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      drop2 = value!;
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17, top: 10, bottom: 10),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Monthly Salary",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 250,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Minimum salary";
                              }
                              return null;
                            },
                            controller: minimum,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(),
                              hintText: 'Minimum',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 282,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Maximum salary";
                              }
                              return null;
                            },
                            controller: maximum,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(),
                              hintText: 'Maximum',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17, top: 10, bottom: 10),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Shift Timings",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: Wrap(
                    children: [
                      RadioListTile(
                        value: 1,
                        title: Container(
                          child: Text(
                            "Day Shift",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        groupValue: selectedRadioTile,
                        onChanged: (value) {
                          print("Radio Tile pressed $value");
                          setSelectedRadioTile(value!);
                        },
                      ),
                      RadioListTile(
                        value: 2,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Night Shift",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        groupValue: selectedRadioTile,
                        onChanged: (value) {
                          print("Radio Tile pressed $value");
                          setSelectedRadioTile(value!);
                        },
                      ),
                      RadioListTile(
                        value: 3,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Any Shift",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        groupValue: selectedRadioTile,
                        onChanged: (value) {
                          print("Radio Tile pressed $value");
                          setSelectedRadioTile(value!);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17, top: 10, bottom: 10),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Job Hours",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: Wrap(
                    children: [
                      RadioListTile(
                        value: 1,
                        title: Text("Full time"),
                        groupValue: selectedRadioTile1,
                        onChanged: (value) {
                          print("Radio Tile pressed $value");
                          setSelectedRadioTile1(value!);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RadioListTile(
                        value: 2,
                        title: Text("Part time"),
                        groupValue: selectedRadioTile1,
                        onChanged: (value) {
                          print("Radio Tile pressed $value");
                          setSelectedRadioTile1(value!);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(92, 179, 255, 1),
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Owner2(
                              job_title.text,
                              drop,
                              number_0f_opening.text,
                              g_button!,
                              drop1,
                              city_town_locality,
                              drop2,
                              minimum.text,
                              maximum.text,
                              selectedRadioTile,
                              selectedRadioTile1,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      textScaleFactor: 1.0,
                      "Next",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
