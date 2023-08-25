import 'dart:developer' as d;
import 'dart:io';
import 'dart:math';
import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:group_button/group_button.dart';

import 'package:image_picker/image_picker.dart';
import 'package:text_editor/text_editor.dart';

class Good_Luck extends StatefulWidget {
  Good_Luck({Key? key}) : super(key: key);

  @override
  State<Good_Luck> createState() => _Good_LuckState();
}

class _Good_LuckState extends State<Good_Luck> {
  final dragController = DragController();
  Offset position = Offset(100, 100);
  double prevScale = 1;
  double scale = 1;
  Offset offset = Offset.zero;
  bool frame = true;
  bool writeh = false;
  GroupButtonController groupcontroller = GroupButtonController();
  List images = [
    "assets/wi1.jpg",
    "assets/wi2.png",
    "assets/wi3.jpg",
    "assets/wi4.png",
    "assets/wi4.png",
  ];
  void updateScale(double zoom) => setState(() => scale = prevScale * zoom);
  void commitScale() => setState(() => prevScale = scale);
  void updatePosition(Offset newPosition) =>
      setState(() => position = newPosition);
  List<Color> color = [
    const Color(0xFFFFC100),
    Color.fromARGB(255, 231, 11, 11),
    Color.fromARGB(255, 9, 255, 0),
    Color.fromARGB(255, 255, 0, 242),
    Color.fromARGB(255, 11, 15, 238),
    Color.fromARGB(255, 11, 238, 227),
  ];
  final ImagePicker picker = ImagePicker();
  var currentindex = 0;
  File? image;
  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
      fontSize: 50,
      color: Colors.white,
      fontFamily: 'Billabong',
    );
    String _text = 'Sample Text';
    TextAlign _textAlign = TextAlign.center;
    final fonts = [
      'Poppins',
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            textScaleFactor: 1.0,
            "Wishes",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(92, 179, 255, 1),
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.black,
                size: 22,
              ),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
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
                                  "Choose Image",
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        XFile? pickedcamera =
                                            await picker.pickImage(
                                                source: ImageSource.camera);
                                        setState(() {
                                          image = File(pickedcamera!.path);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/Group1.png",
                                            height: 100,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            textScaleFactor: 1.0,
                                            "Pick from camera",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        XFile? pickedgallery =
                                            await picker.pickImage(
                                                source: ImageSource.gallery);
                                        setState(() {
                                          image = File(pickedgallery!.path);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/Group2.png",
                                            height: 100,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            textScaleFactor: 1.0,
                                            "Pick from Gallery",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
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
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${images[currentindex]}",
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
            (frame)
                ? Positioned(
                    bottom: 0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(images.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentindex = index;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1.5)),
                                child: Image.asset("${images[index]}",
                                    height: 80, width: 80, fit: BoxFit.fill),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: TextEditor(
                      fonts: fonts,
                      paletteColors: color,
                      onEditCompleted: (style, align, text) {
                        setState(() {
                          style = TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold);
                          align = TextAlign.center;
                          text = "Utsav";
                        });
                      },
                    ),
                  ),
            //  Positioned(
            //   left: position.dx,
            //   top: position.dy,
            //   child: Draggable(
            //     maxSimultaneousDrags: 1,
            //     feedback: widget.child,
            //     childWhenDragging: Opacity(
            //       opacity: .3,
            //       child: widget.child,
            //     ),
            //     onDragEnd: (details) => updatePosition(details.offset),
            //     child: Transform.scale(
            //       scale: scale,
            //       child: widget.child,
            //     ),
            //   ),),
            Positioned(
                child: image != null
                    ? Image.file(
                        File(image!.path),
                        height: 50,
                        width: 50,
                      )
                    : Container()),
          ],
        ),
        bottomNavigationBar: Container(
          child: GroupButton(
            controller: groupcontroller,
            options: GroupButtonOptions(
              borderRadius: BorderRadius.circular(8),
              buttonWidth: 170,
              selectedColor: Color.fromRGBO(92, 179, 255, 1),
              // unselectedColor: Colors.white,
              unselectedBorderColor: Color.fromRGBO(92, 179, 255, 1),
              selectedBorderColor: Colors.transparent,
            ),
            buttons: [
              'Frame',
              'Write Here',
            ],
            onSelected: (value, index, isSelected) {
              setState(() {
                d.log("${value} , ${index} , ${isSelected}");
                (index == 1) ? frame = false : frame = true;
              });
            },
          ),
        ),
      ),
    );
  }
}
