import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class create_reels extends StatefulWidget {
  const create_reels({super.key});

  @override
  State<create_reels> createState() => _create_reelsState();
}

class _create_reelsState extends State<create_reels> {
  List<Color> c_color = [
    Colors.white,
    Colors.brown.shade400,
    Colors.blue.shade400,
    Colors.pink.shade400,
    Colors.amber.shade400,
    Colors.blueAccent.shade400,
    Colors.blueGrey.shade400,
    Colors.green.shade400,
    Colors.grey.shade400,
    Colors.black,
    Colors.purple.shade400,
    Colors.indigo.shade400,
    Colors.red.shade400,
    Colors.yellow.shade400,
    Colors.teal.shade400,
    Colors.orange.shade400,
    Colors.deepPurple.shade400,
  ];

  Color current_color = Colors.white;
  PlatformFile? file;
  bool t = false;
  ChewieController? _chewieController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: current_color,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: current_color,
            //   child: TextEditor(
            //     fonts: [
            //       "OpenSans",
            //       "Billabong",
            //       "OpenSans",
            //       "Billabong",
            //       "OpenSans",
            //       "Billabong",
            //       "OpenSans",
            //       "Billabong",
            //       "OpenSans",
            //       "Billabong",
            //       "OpenSans",
            //       "Billabong",
            //     ],
            //     // paletteColors: colors,
            //     // text: text,
            //     // textStyle: textStyle,
            //     // textAlingment: textAlign,
            //     onEditCompleted: (style, align, text) {
            //       setState(() {
            //         // _text = text;
            //         // _textStyle = style;
            //         // _textAlign = align;
            //       });
            //     },
            //   ),
          ),
          Container(
            child: (t == true) ? Chewie(controller: _chewieController!) : null,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade800.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // TextEditor(
                        //   fonts: fonts,
                        //   text: text,
                        //   textStyle: textStyle,
                        //   textAlingment: textAlign,
                        //   decoration: EditorDecoration(
                        //     doneButton: Icon(Icons.close, color: Colors.white),
                        //     fontFamily: Icon(Icons.title, color: Colors.white),
                        //     colorPalette:
                        //         Icon(Icons.palette, color: Colors.white),
                        //     alignment: AlignmentDecoration(
                        //       left: Text(
                        //         'left',
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //       center: Text(
                        //         'center',
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //       right: Text(
                        //         'right',
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //     ),
                        //   ),
                        //   onEditCompleted: (TextStyle, TextAlign, String) {},
                        // );
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade800.withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.font_download_outlined,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['mp4'],
                        );

                        if (result != null) {
                          file = result.files.single;
                          _chewieController = ChewieController(
                            videoPlayerController: VideoPlayerController.file(
                              File(
                                file!.path.toString(),
                              ),
                            ),
                            autoPlay: true,
                            showControls: false,
                            looping: true,
                            // fullScreenByDefault: true,
                            allowFullScreen: true,
                            aspectRatio: MediaQuery.of(context).size.width /
                                MediaQuery.of(context).size.height,
                          );

                          t = true;

                          print(file!.name);
                          print(file!.bytes);
                          print(file!.size);
                          print(file!.extension);
                          print(file!.path);
                          setState(() {});
                        } else {
                          print("null image");
                          setState(() {});
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade800.withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.video_collection_outlined,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 80,
                              color: Colors.transparent,
                              child: ListView.builder(
                                itemCount: c_color.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current_color = c_color[index];
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: c_color[index],
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade800.withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.color_lens_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
