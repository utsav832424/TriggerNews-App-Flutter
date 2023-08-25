import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:trigger_news_1/apiService.dart';
import 'package:trigger_news_1/matarea.dart';

class citych extends StatefulWidget {
  const citych({super.key, this.stateid, this.state, this.city});
  final stateid;
  final state;
  final city;
  @override
  State<citych> createState() => _citychState();
}

class _citychState extends State<citych> {
  var cityindex;
  late SharedPreferences pref;
  ApiService apiService = ApiService();
  TextEditingController s_state = TextEditingController();
  var userid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.state != null) {
      s_state.text = widget.state;
    }
    init();
  }

  List data1 = [];
  init() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    log("userid : ${userid}");
    var resdata = await apiService.getCall('/city/getcity/${widget.stateid}');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
    });
  }

  GroupButtonController? groupcontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(92, 179, 255, 1),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          textScaleFactor: 1.0,
          "Your Place",
          style: TextStyle(
            color: Color.fromRGBO(92, 179, 255, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/location.png',
                        height: 80,
                        width: 80,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Where in Gujrat....?",
                    style: TextStyle(
                        color: Color.fromRGBO(92, 179, 255, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_searching_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        textScaleFactor: 1.0,
                        "Auto selection location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    backgroundColor: Color.fromRGBO(92, 179, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: s_state,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Serch City"),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(92, 179, 255, 1),
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(92, 179, 255, 1),
                      ),
                      child: Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    textScaleFactor: 1.0,
                    "Which District...?",
                    style: TextStyle(
                        color: Color.fromRGBO(92, 179, 255, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: GroupButton(
                        // isRadio: false,
                        enableDeselect: true,
                        controller: groupcontroller,
                        options: GroupButtonOptions(
                          borderRadius: BorderRadius.circular(8),
                          buttonWidth: 155,
                          selectedColor: Color.fromRGBO(92, 179, 255, 1),
                          // unselectedColor: Colors.white,
                          unselectedBorderColor:
                              Color.fromRGBO(92, 179, 255, 1),
                          selectedBorderColor: Colors.transparent,
                        ),
                        buttons: [
                          for (var item in data1) '${item["cityname"]}'
                        ],
                        onSelected: (value, index, isSelected) {
                          setState(() {
                            cityindex = index + 1;
                            log("${value} , ${index + 1} , ${isSelected}");
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 3,
              width: MediaQuery.of(context).size.width,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Matares(
                            cityid: cityindex,
                            city: widget.city,
                          ),
                        ));
                  },
                  child: Text(
                    textScaleFactor: 1.0,
                    "Confirm Location",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    backgroundColor: Color.fromRGBO(92, 179, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
