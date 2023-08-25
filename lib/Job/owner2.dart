import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:trigger_news_1/Job/owner1.dart';

class Owner2 extends StatefulWidget {
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
  FilePickerResult? result1;

  Owner2(
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
  );

  @override
  State<Owner2> createState() => _Owner2State();
}

class _Owner2State extends State<Owner2> {
  File? file;
  int choice = 0;
  int choice1 = 0;
  bool select = false;
  bool phone = false;
  bool phone1 = false;
  bool check = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController company = TextEditingController();
  TextEditingController caling = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  File? images;

  FilePickerResult? result1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: Column(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Company Details",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Tell the candidate about your company",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            SizedBox(width: 70),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(92, 179, 255, 1),
                              ),
                              child: SimpleCircularProgressBar(
                                backColor: Colors.transparent,
                                size: 30,
                                progressStrokeWidth: 3,
                                // backStrokeWidth: 2,
                                progressColors: [
                                  Color.fromRGBO(92, 179, 255, 1),
                                ],
                                maxValue: 3,
                                fullProgressColor:
                                    Color.fromRGBO(92, 179, 255, 1),
                                mergeMode: true,
                                onGetText: (double value) {
                                  return Text(
                                    '2/3',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 6),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter the company';
                            }
                            return null;
                          },
                          maxLength: 255,
                          controller: company,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide()),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide()),
                              contentPadding: EdgeInsets.all(7),
                              hintText: "Company you're hiring for",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Select your role",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            visualDensity: VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            activeColor: Color.fromRGBO(92, 179, 255, 1),
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              "I work at this company",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: 1,
                            groupValue: choice,
                            onChanged: (value) {
                              setState(() {
                                choice = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            contentPadding: EdgeInsets.zero,
                            activeColor: Color.fromRGBO(92, 179, 255, 1),
                            title: Text(
                              "I  am owner of this company",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: 2,
                            groupValue: choice,
                            onChanged: (value) {
                              setState(() {
                                choice = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            visualDensity: VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            contentPadding: EdgeInsets.zero,
                            activeColor: Color.fromRGBO(92, 179, 255, 1),
                            title: Text(
                              "I am form  a job agency",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            value: 3,
                            groupValue: choice,
                            onChanged: (value) {
                              setState(() {
                                choice = value!;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Manage candidates through:",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 85,
                              margin:
                                  EdgeInsets.only(left: 20, top: 7, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone_enabled,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                        Image.asset(
                                          'assets/14.png',
                                          height: 15,
                                          width: 15,
                                        ),
                                      ],
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      activeColor:
                                          Color.fromRGBO(92, 179, 255, 1),
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        "Calls & WhatsApp",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      ),
                                      value: 1,
                                      groupValue: choice1,
                                      onChanged: (int? value) {
                                        setState(() {
                                          choice1 = value!;
                                          phone = true;
                                          phone1 = true;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 85,
                              width: 100,
                              margin:
                                  EdgeInsets.only(left: 10, top: 7, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.phone_enabled,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    RadioListTile(
                                      visualDensity: VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      activeColor:
                                          Color.fromRGBO(92, 179, 255, 1),
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        "Calls ",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      ),
                                      value: 2,
                                      groupValue: choice1,
                                      onChanged: (value) {
                                        setState(() {
                                          choice1 = value!;
                                          phone = true;
                                          phone1 = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      (phone == true)
                          ? Container(
                              color: Colors.grey.shade100,
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Candidates are more likely to call you between 8:00 AM - 8:00 PM",
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Your Calling number",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter phone number';
                                      }
                                      return null;
                                    },
                                    controller: caling,
                                    maxLength: 10,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          borderSide: BorderSide(),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide()),
                                        contentPadding: EdgeInsets.all(7),
                                        hintText: "Phone number",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                      (phone1 == true)
                          ? Container(
                              color: Colors.grey.shade100,
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your WhatsApp number",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: check,
                                        onChanged: (value) {
                                          check = value!;
                                          setState(() {
                                            if (check == true) {
                                              whatsapp.text = caling.text;
                                            } else {
                                              whatsapp.clear();
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        "Your WhatsApp number",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter whatsApp number';
                                      }
                                      return null;
                                    },
                                    controller: whatsapp,
                                    maxLength: 10,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          borderSide: BorderSide(),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: BorderSide()),
                                        contentPadding: EdgeInsets.all(7),
                                        hintText: "WhatsApp number",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              "Upload Logo",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "(optional)",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      InkResponse(
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(
                                  type: FileType.image, allowMultiple: true);

                          if (result != null) {
                            file = File(result.files.single.path!);
                            log("Image :- ${file!.path.toString()}");

                            result1 = result;
                            setState(() {
                              print(images);
                            });
                            print("FILE${file}");
                            setState(() {});
                          } else {
                            print("User canceld the picker");
                          }
                        },
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 20, top: 7, right: 20),
                          decoration: (file == null)
                              ? BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 1),
                                )
                              : null,
                          child: (file == null)
                              ? Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    File(
                                      file!.path,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          "You can upload  a company logo, Company ID or a  visiting card ",
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 10),
                        ),
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
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Owner1(
                                      widget.jobtitle,
                                      widget.drop,
                                      widget.numberofopening,
                                      widget.g_button,
                                      widget.drop1,
                                      widget.city,
                                      widget.drop2,
                                      widget.min,
                                      widget.max,
                                      widget.selectedRadioTile,
                                      widget.selectedRadioTile1,
                                      company.text,
                                      choice,
                                      choice1,
                                      caling.text,
                                      file!.path.toString(),
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
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
