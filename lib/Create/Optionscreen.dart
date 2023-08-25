import 'package:flutter/material.dart';

class Optionscreen extends StatefulWidget {
  const Optionscreen({super.key});

  @override
  State<Optionscreen> createState() => _OptionscreenState();
}

class _OptionscreenState extends State<Optionscreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 110),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person, size: 18),
                        radius: 16,
                      ),
                      SizedBox(width: 6),
                      Text(textScaleFactor: 1.0, 'flutter_developer02'),
                      SizedBox(width: 10),
                      Icon(Icons.verified, size: 15),
                      SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          textScaleFactor: 1.0,
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  Text(
                      textScaleFactor: 1.0,
                      'Flutter is beautiful and fast 💙❤💛 ..'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                      ),
                      Text(
                          textScaleFactor: 1.0,
                          'Original Audio - some music track--'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Icon(Icons.favorite_outline)),
                  Text(textScaleFactor: 1.0, '601k'),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Icon(Icons.comment_rounded)),
                  Text(textScaleFactor: 1.0, '1123'),
                  SizedBox(height: 20),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: Icon(Icons.send),
                  ),
                  SizedBox(height: 50),
                  Icon(Icons.more_vert),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
