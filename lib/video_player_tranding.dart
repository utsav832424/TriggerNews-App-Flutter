import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class video_player_tranding extends StatefulWidget {
  const video_player_tranding({super.key});

  @override
  State<video_player_tranding> createState() => _video_player_trandingState();
}

class _video_player_trandingState extends State<video_player_tranding> {
  late FlickManager flickManager;
  bool islike = false;
  int likecount = 12;

  List url = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  ];
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 210,
                  child: Stack(
                    children: [
                      FlickVideoPlayer(
                        flickManager: flickManager,
                      ),
                      Positioned(
                          child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      )),
                    ],
                  )),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "Water level rising fast in Jhelum, tributaries due to continued rain in J&K",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "The water level in the Jhelum river and its tributaries has risen rapidly over a few hours due to heavy rainfall at many places in Kashmir, even as authorities have advised the people living near the embankments of water bodies to remain alert and avoid venturing near the water in some of the water bodies is flowing close to the flood-alert level at many places, officials said.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 17,
                              backgroundImage: AssetImage("assets/kaka.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Paresh",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "1 Hour ago",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.visibility,
                              color: Colors.grey,
                              size: 17,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "51 Views",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
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
            Divider(
              height: 0,
            ),
            Expanded(
              flex: 0,
              child: Container(
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
                                color: (islike == true) ? Colors.red : null,
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
                                        height:
                                            MediaQuery.of(context).size.height -
                                                70 -
                                                MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 0,
                                              child: Text(
                                                "Comment",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Divider(),
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    contentPadding:
                                                        EdgeInsets.all(0),
                                                    leading: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    title: Text("Hello"),
                                                    subtitle: Text(
                                                      "Recently",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade500,
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
                                                    child: TextFormField(
                                                      decoration: InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          10,
                                                                      horizontal:
                                                                          10),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          hintText:
                                                              "Add Comment"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color.fromRGBO(
                                                          92, 179, 255, 1),
                                                    ),
                                                    child: Icon(
                                                      Icons.send,
                                                      color: Colors.white,
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
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          FileDownloader.downloadFile(
                            url: url[0],
                            onProgress: (fileName, progress) {
                              setState(() {});
                            },
                            onDownloadCompleted: (String path) {
                              Fluttertoast.showToast(
                                msg: "Download Successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                textColor: Colors.white,
                              );
                            },
                            onDownloadError: (String error) {
                              Fluttertoast.showToast(
                                msg: "Download Failed",
                                toastLength: Toast.LENGTH_SHORT,
                                textColor: Colors.white,
                              );
                            },
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.download_outlined,
                              ),
                              Text(
                                "Download",
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
                      width: 1,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
