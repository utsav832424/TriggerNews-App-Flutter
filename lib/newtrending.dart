import 'package:flutter/material.dart';
import 'package:trigger_news_1/Navbar/profile.dart';
import 'package:trigger_news_1/Search/Tranding/tranding_detail.dart';
import 'package:trigger_news_1/mainnews.dart';
import 'package:trigger_news_1/video_player_tranding.dart';

class NewTrending extends StatefulWidget {
  const NewTrending({super.key});

  @override
  State<NewTrending> createState() => _NewTrendingState();
}

class _NewTrendingState extends State<NewTrending> {
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

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
                for (var item in [1, 2, 3, 4])
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(1, 1),
                                spreadRadius: 0,
                                blurRadius: 10),
                          ],
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          video_player_tranding(),
                                    ));
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child:
                                            Image.asset('assets/image 13.png'),
                                      ),
                                      Positioned(
                                        child: Image.asset(
                                          "assets/player.png",
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Positioned(
                                          right: 10,
                                          top: 10,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                bottom: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.black),
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "01:25:20",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "Video: The duration of the monsoon lies between 100 and 120 days initiating from early June to mid-September",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Icon(Icons.person,
                                          color: Color.fromRGBO(79, 79, 79, 1)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        "By Sahil",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(79, 79, 79, 1)),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 8,
                                          bottom: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  182, 181, 181, 1))),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/14.png",
                                            height: 20,
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "Share",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      79, 79, 79, 1)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Icon(Icons.more_vert,
                                          color: Color.fromRGBO(79, 79, 79, 1)),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Profile(),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          'https://staticg.sportskeeda.com/editor/2023/01/8f968-16744563549166-1920.jpg?w=840',
                                          fit: BoxFit.cover,
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "Vande Bharat 4",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "Udhna",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "12 hrs ago",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        textScaleFactor: 1.0,
                                        "Subscribe",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showGeneralDialog(
                                          barrierLabel: "Label",
                                          barrierDismissible: true,
                                          barrierColor:
                                              Colors.black.withOpacity(0.5),
                                          transitionDuration:
                                              Duration(milliseconds: 700),
                                          context: context,
                                          pageBuilder: (context, anim1, anim2) {
                                            return StatefulBuilder(builder: (
                                              BuildContext context,
                                              setState,
                                            ) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Scaffold(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  body: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 50,
                                                          left: 12,
                                                          right: 12),
                                                      // padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            239, 243, 246, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      height: 450,
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        92,
                                                                        179,
                                                                        255,
                                                                        1),
                                                              ),
                                                              child: Text(
                                                                textScaleFactor:
                                                                    1.0,
                                                                "Block the post",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              child: Text(
                                                                textScaleFactor:
                                                                    1.0,
                                                                "Please let us know why you want to report this post.",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "Offensive content",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "Disturbing scenes",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "fack news",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "Disturbing scenes",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "Disturbing scenes",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        activeColor:
                                                                            Colors.blue,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      "other reasons",
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20),
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  child:
                                                                      ElevatedButton(
                                                                          style: ElevatedButton
                                                                              .styleFrom(
                                                                            primary: Color.fromRGBO(
                                                                                92,
                                                                                179,
                                                                                255,
                                                                                1),
                                                                            onPrimary:
                                                                                Colors.white,
                                                                          ),
                                                                          onPressed:
                                                                              () {},
                                                                          child: Text(
                                                                              textScaleFactor: 1.0,
                                                                              "Submit")),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                          transitionBuilder:
                                              (context, anim1, anim2, child) {
                                            return SlideTransition(
                                              position: Tween(
                                                      begin: Offset(0, 1),
                                                      end: Offset(0, 0))
                                                  .animate(anim1),
                                              child: child,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        child: Icon(
                                          Icons.more_vert_outlined,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainNews(),
                                    ));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "‘Ajmal’s people’ will take all medical, engineering seats if Assam doesn t prioritise education Himanta",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      'https://staticg.sportskeeda.com/editor/2023/01/8f968-16744563549166-1920.jpg?w=840',
                                      fit: BoxFit.cover,
                                      width: 450,
                                      height: 300,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          textScaleFactor: 1.0,
                                          "365",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade400,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              textScaleFactor: 1.0,
                                              "2 hourse ago",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.favorite_outline,
                                        ),
                                        Text(
                                          textScaleFactor: 1.0,
                                          "Like",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 2,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.chat,
                                        ),
                                        Text(
                                          textScaleFactor: 1.0,
                                          "Whatsaap",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 2,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.download_outlined,
                                        ),
                                        Text(
                                          textScaleFactor: 1.0,
                                          "Like",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 1,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.share_outlined,
                                        ),
                                        Text(
                                          textScaleFactor: 1.0,
                                          "Share",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
