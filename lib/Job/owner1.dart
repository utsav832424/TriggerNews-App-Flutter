import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news_1/Job/owner2.dart';
import 'package:trigger_news_1/apiService.dart';

class Owner1 extends StatefulWidget {
  String jobtitle;
  int drop;
  String numberofopening;
  int g_button;
  int drop1;
  int city;
  int drop2;
  String min;
  String max;
  int selectedRadioTile;
  int selectedRadioTile1;
  String company;
  int choice;
  int choice1;
  String calling;
  String images;
  Owner1(
    this.jobtitle,
    this.drop,
    this.numberofopening,
    this.g_button,
    this.drop1,
    this.city,
    this.drop2,
    this.min,
    this.max,
    this.selectedRadioTile,
    this.selectedRadioTile1,
    this.company,
    this.choice,
    this.choice1,
    this.calling,
    this.images,
  );

  @override
  State<Owner1> createState() => _Owner1State();
}

class _Owner1State extends State<Owner1> {
  int selectedValue = 0;
  String selectedValue1 = "";
  int radio = 0;
  String radio1 = "";
  bool select = false;
  bool isChecked = false;
  bool isChecked1 = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController additional = TextEditingController();
  TextEditingController fees = TextEditingController();
  var userid;

  ApiService apiService = ApiService();
  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    log("userid ${userid}");
    log("userid $userid");
    log("job title ${widget.jobtitle}");
    log("job category ${widget.drop}");
    log("numof ope${widget.numberofopening}");
    log("job type ${widget.g_button}");
    log("district ${widget.drop1}");
    log("city ${widget.city}");
    log("can_pref ${widget.drop2}");
    log("mini ${widget.min}");
    log("maxi ${widget.max}");
    log("shift-timing ${widget.selectedRadioTile}");
    log("job_houres ${widget.selectedRadioTile1}");
    log("hiring ${widget.company}");
    log("role ${widget.choice}");
    log("calling number ${widget.calling}");
    log("images ${widget.images}");
    fees.text = "1";
  }

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
            child: Form(
              key: _formkey,
              child: ListView(
                padding: EdgeInsets.only(top: 2),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "Choose Language",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 90),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkResponse(
                                        onTap: () {
                                          setState(() {
                                            select = !select;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: select
                                                  ? Colors.white
                                                  : Color.fromRGBO(
                                                      92, 179, 255, 1),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.zero,
                                                  bottomRight: Radius.zero,
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  topLeft: Radius.circular(8)),
                                              border: Border.all(
                                                color: select
                                                    ? Colors.grey
                                                    : Color.fromRGBO(
                                                        92, 179, 255, 1),
                                              )),
                                          child: Center(
                                            child: Text(
                                              "Gujarati",
                                              style: TextStyle(
                                                  color: select
                                                      ? Colors.grey
                                                      : Colors.black,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkResponse(
                                        onTap: () {
                                          setState(() {
                                            select = !select;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: select
                                                  ? Color.fromRGBO(
                                                      92, 179, 255, 1)
                                                  : Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(8),
                                                  bottomLeft: Radius.zero,
                                                  topLeft: Radius.zero),
                                              border: Border.all(
                                                color: select
                                                    ? Color.fromRGBO(
                                                        92, 179, 255, 1)
                                                    : Colors.grey,
                                              )),
                                          child: Center(
                                            child: Text(
                                              "English",
                                              style: TextStyle(
                                                  color: select
                                                      ? Colors.black
                                                      : Colors.grey,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 30,
                        color: Color.fromRGBO(92, 179, 255, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffFFBB00),
                              size: 15,
                            ),
                            Text(
                              "Your first job post on lokal is free!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Candidate Requirement",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Choose the best candidate for your company",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text(
                              'Years of Experience ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Container(
                                  child:
                                      Text(textScaleFactor: 1.0, "0-1 Years"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Container(
                                  child:
                                      Text(textScaleFactor: 1.0, "1-3 Years"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Container(
                                  child:
                                      Text(textScaleFactor: 1.0, "3-5 Years"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Container(
                                  child:
                                      Text(textScaleFactor: 1.0, "5-10 Years"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 5,
                                child: Container(
                                  child:
                                      Text(textScaleFactor: 1.0, "10-15 Years"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 6,
                                child: Container(
                                  child:
                                      Text(textScaleFactor: 1.0, ">15 Years"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 7,
                                child: Container(
                                  child: Text(
                                      textScaleFactor: 1.0, "Any Experience"),
                                ),
                              ),
                            ],
                            value: (selectedValue == 0) ? null : selectedValue,
                            onChanged: (value) {
                              selectedValue = value! as int;
                              setState(() {});
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 40,
                              width: 140,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Years of Education ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "10th",
                                child: Container(
                                  child: Text(textScaleFactor: 1.0, "10th"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "12th",
                                child: Container(
                                  child: Text(textScaleFactor: 1.0, "12th"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Diploma/Certification",
                                child: Container(
                                  child: Text(
                                      textScaleFactor: 1.0,
                                      "Diploma/Certification"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Post Graduate",
                                child: Container(
                                  child: Text(
                                      textScaleFactor: 1.0, "Post Graduate"),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Not Required",
                                child: Container(
                                  child: Text(
                                      textScaleFactor: 1.0, "Not Required"),
                                ),
                              ),
                            ],
                            value: (selectedValue1.isEmpty)
                                ? null
                                : selectedValue1,
                            onChanged: (value) {
                              selectedValue1 = value!.toString();
                              setState(() {});
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 40,
                              width: 140,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 20),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Preferred Gender",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                activeColor: Color.fromRGBO(92, 179, 255, 1),
                                value: 1,
                                groupValue: radio,
                                onChanged: (value) {
                                  radio = value!;
                                  setState(() {});
                                },
                              ),
                              Text("Male")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor: Color.fromRGBO(92, 179, 255, 1),
                                value: 2,
                                groupValue: radio,
                                onChanged: (value) {
                                  radio = value.toString() as int;
                                  setState(() {});
                                },
                              ),
                              Text("Female")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor: Color.fromRGBO(92, 179, 255, 1),
                                value: 3,
                                groupValue: radio,
                                onChanged: (value) {
                                  radio = value.toString() as int;
                                  setState(() {});
                                },
                              ),
                              Text("Any Gender")
                            ],
                          ),
                        ],
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 10, top: 20),
                      //   alignment: AlignmentDirectional.topStart,
                      //   child: Text(
                      //     "Is there any fee charged to the canddidate?",
                      //     style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      // Row(
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Radio(
                      //           activeColor: Color.fromRGBO(92, 179, 255, 1),
                      //           value: "Yes",
                      //           groupValue: radio1,
                      //           onChanged: (value) {
                      //             radio1 = value.toString();
                      //             setState(() {});
                      //           },
                      //         ),
                      //         Text("yes")
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         Radio(
                      //           activeColor: Color.fromRGBO(92, 179, 255, 1),
                      //           value: "No",
                      //           groupValue: radio1,
                      //           onChanged: (value) {
                      //             radio1 = value.toString();
                      //             setState(() {});
                      //           },
                      //         ),
                      //         Text("No")
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Addition Info",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "(Optional)",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Job title';
                            }
                            return null;
                          },
                          controller: additional,
                          cursorColor: Colors.grey,
                          maxLength: 1500,
                          maxLines: 2,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
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
                            hintText: 'Job Tittle',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Checkbox(
                              checkColor: Colors.white,
                              activeColor: Color.fromRGBO(92, 179, 255, 1),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            child: Text(
                              "Get updatefor your job on whattsup",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Checkbox(
                              checkColor: Colors.white,
                              activeColor: Color.fromRGBO(92, 179, 255, 1),
                              value: isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked1 = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            child: Text(
                              "Terms and Conditions",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(92, 179, 255, 1),
                              onPrimary: Colors.white,
                            ),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                var mulitfile =
                                    await MultipartFile.fromFile(widget.images);
                                log("$mulitfile");
                                var data = Map<String, dynamic>();
                                data["user_id"] = userid;
                                data["job_title"] = widget.jobtitle;
                                data["job_category"] = widget.drop;
                                data["numof_open"] = widget.numberofopening;
                                data["job_type"] = widget.g_button;
                                data["district"] = widget.drop1;
                                data["city"] = widget.city;
                                data["can_prfer_from"] = widget.drop2;
                                data["minimum"] = widget.min;
                                data["maximum"] = widget.max;
                                data["shift_timimg"] = widget.selectedRadioTile;
                                data["job_hours"] = widget.selectedRadioTile1;
                                data["hiring_for"] = widget.company;
                                data["role"] = widget.choice;
                                data["calls_whatsapp"] = widget.calling;
                                data["image"] = mulitfile;
                                data["experience"] = selectedValue;
                                data["education"] = selectedValue1;
                                data["gender"] = radio;
                                data["free_charge"] = fees.text;
                                data["additinal_info"] = additional.text;
                                var resdata = await apiService.postCall(
                                    'job/addjob', data);
                                if (resdata["success"] == 1) {
                                  Navigator.pop(context);
                                  setState(() {});
                                }
                                setState(() {});
                              }
                            },
                            child: Text(
                              textScaleFactor: 1.0,
                              "Submit",
                            ),
                          ),
                        ),
                      ),
                    ],
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
// style: TextStyle(
//     fontSize: 50,
//     decoration: TextDecoration.underline, // <-- SEE HERE
//   ),