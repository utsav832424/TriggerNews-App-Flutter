import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

class greeting extends StatefulWidget {
  const greeting({super.key});

  @override
  State<greeting> createState() => _greetingState();
}

class _greetingState extends State<greeting> {
  bool islike = false;
  int likecount = 12;

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
            child: ListView.builder(
              padding: EdgeInsets.only(top: 5),
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Bhargav",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Birthday",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Wish you many many",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "For Rasikbhai",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Image.asset(
                          "assets/wi3.jpg",
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          islike = !islike;
                                          likecount += (islike) ? 1 : -1;

                                          setState(() {});
                                        },
                                        child: Icon(
                                          (islike == true)
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: (islike == true)
                                              ? Colors.red
                                              : null,
                                        ),
                                      ),
                                      Text(
                                        "$likecount Like",
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
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: SafeArea(
                                                top: true,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      70 -
                                                      MediaQuery.of(context)
                                                          .viewInsets
                                                          .bottom,
                                                  padding: EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15),
                                                      topRight:
                                                          Radius.circular(15),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 0,
                                                        child: Text(
                                                          "Comment",
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount: 5,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return ListTile(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              leading:
                                                                  Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons.person,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              title:
                                                                  Text("Hello"),
                                                              subtitle: Text(
                                                                "Recently",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                        flex: 0,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                decoration: InputDecoration(
                                                                    contentPadding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10,
                                                                        horizontal:
                                                                            10),
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
                                                                    hintText:
                                                                        "Add Comment"),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        92,
                                                                        179,
                                                                        255,
                                                                        1),
                                                              ),
                                                              child: Icon(
                                                                Icons.send,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.chat,
                                        ),
                                        Text(
                                          "Comment",
                                        ),
                                      ],
                                    ),
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
                              // Expanded(
                              //   child: GestureDetector(
                              //     onTap: () async {
                              //       FileDownloader.downloadFile(
                              //         url: url[0],
                              //         onProgress: (fileName, progress) {
                              //           setState(() {});
                              //         },
                              //         onDownloadCompleted: (String path) {
                              //           Fluttertoast.showToast(
                              //             msg: "Download Successfully",
                              //             toastLength: Toast.LENGTH_SHORT,
                              //             textColor: Colors.white,
                              //           );
                              //         },
                              //         onDownloadError: (String error) {
                              //           Fluttertoast.showToast(
                              //             msg: "Download Failed",
                              //             toastLength: Toast.LENGTH_SHORT,
                              //             textColor: Colors.white,
                              //           );
                              //         },
                              //       );
                              //     },
                              //     child: Container(
                              //       child: Column(
                              //         children: [
                              //           Icon(
                              //             Icons.download_outlined,
                              //           ),
                              //           Text(
                              //             "Download",
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              // Container(
                              //   padding: EdgeInsets.all(5),
                              //   width: 1,
                              //   height: 30,
                              //   decoration: BoxDecoration(
                              //     color: Colors.grey[300],
                              //   ),
                              // ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    await Share.share('Hello',
                                        subject: 'Look what I made!');

                                    setState(() {});
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.share_outlined,
                                        ),
                                        Text(
                                          "Share",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
