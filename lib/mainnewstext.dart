import 'package:flutter/material.dart';

class mainnewstext extends StatefulWidget {
  const mainnewstext(
      {super.key,
      this.profile_img,
      this.headline,
      this.username,
      this.news,
      this.time});
  final profile_img;
  final headline;
  final username;
  final time;

  final news;
  @override
  State<mainnewstext> createState() => _mainnewstextState();
}

class _mainnewstextState extends State<mainnewstext> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  color: Color.fromRGBO(0, 0, 0, 0.25))
                            ],
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //     color: Color.fromRGBO(0, 0, 0, 0.25)),
                            color: Color.fromRGBO(219, 224, 249, 1),
                          ),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  color: Color.fromRGBO(0, 0, 0, 0.25))
                            ],
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //     color: Color.fromRGBO(0, 0, 0, 0.25)),
                            color: Color.fromRGBO(219, 224, 249, 1)),
                        child: widget.profile_img == null
                            ? Icon(
                                Icons.person,
                                color: Colors.white,
                              )
                            : Image.network(
                                'http://144.91.124.145/~codecha/trigger_news/' +
                                    widget.profile_img,
                                height: 30,
                                width: 30,
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              textScaleFactor: 1.0,
                              "${widget.username}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          ),
                          Container(
                            child: Text(
                              textScaleFactor: 1.0,
                              "${widget.time} hrs ago",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(152, 152, 152, 1)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                            blurRadius: 4,
                            color: Color.fromRGBO(0, 0, 0, 0.25))
                      ],
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //     color: Color.fromRGBO(0, 0, 0, 0.25)),
                      color: Color.fromRGBO(219, 224, 249, 1),
                    ),
                    child: Icon(Icons.bookmark_border),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  textScaleFactor: 1.0,
                  "${widget.news}",
                  style: TextStyle(
                    color: Color.fromRGBO(126, 126, 126, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
