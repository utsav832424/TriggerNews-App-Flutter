import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:trigger_news_1/Job/iwantjob.dart';
import 'package:trigger_news_1/owner.dart';

class Job extends StatefulWidget {
  Job({Key? key}) : super(key: key);

  @override
  State<Job> createState() => _JobState();
}

class _JobState extends State<Job> {
  String _selectedGender = 'male';
  var _result;
  bool radio1 = false;
  bool radio2 = false;
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                //   height: 30,
                // ),
              ],
            ),
          ],
        ),
        toolbarHeight: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        backgroundColor: Color.fromRGBO(92, 179, 255, 1),
      ),
      // body: Container(
      //   padding: EdgeInsets.all(20),
      //   margin: EdgeInsets.all(20),
      //   // height: 40,
      //   width: MediaQuery.of(context).size.width,
      //   decoration: BoxDecoration(
      //       color: Color.fromRGBO(92, 179, 255, 1),
      //       borderRadius: BorderRadius.circular(20)),
      //   child: Text(textScaleFactor: 1.0,
      //     "Select a Job",
      //     textAlign: TextAlign.center,
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(92, 179, 255, 1),
            onPrimary: Colors.white,
          ),
          onPressed: () {
            showAnimatedDialog(
              barrierDismissible: true,
              context: context,
              // barrierDismissible: true,
              builder: (BuildContext context) {
                return StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    contentPadding: const EdgeInsets.all(0),
                    content: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(92, 179, 255, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              textScaleFactor: 1.0,
                              "What are you looking for?",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RadioListTile(
                                    selectedTileColor: Colors.red,
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/wanttojob.png",
                                          height: 100,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          textScaleFactor: 1.0,
                                          "I Want a Job..",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: 4,
                                    groupValue: _result,
                                    onChanged: (value) {
                                      setState(() {
                                        _result = value;
                                        radio1 = !radio1;
                                      });
                                    }),
                                RadioListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/lookingemployee.png",
                                          height: 100,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 90,
                                          child: Text(
                                            textScaleFactor: 1.0,
                                            "I looking for an employee..",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: 5.4,
                                    groupValue: _result,
                                    onChanged: (value) {
                                      setState(() {
                                        _result = value;
                                        radio2 = !radio2;
                                      });
                                    }),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Color.fromRGBO(92, 179, 255, 1),
                                    ),
                                    onPressed: () {
                                      if (radio1 == true) {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Iwantjob(),
                                            ));
                                        setState(() {
                                          radio1 = !radio1;
                                        });
                                      }
                                      if (radio2 == true) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Owner(),
                                            ));
                                        setState(() {
                                          radio2 = !radio2;
                                        });
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
                          )
                        ],
                      ),
                    ),
                  );
                });
              },
              animationType: DialogTransitionType.fadeRotate,
            );
          },
          child: Text(
            textScaleFactor: 1.0,
            "Select a Job",
          ),
        ),
      ),
    );
  }
}
