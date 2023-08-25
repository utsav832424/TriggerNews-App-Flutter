import 'package:flutter/material.dart';

class MainNews extends StatefulWidget {
  const MainNews(
      {super.key,
      this.profile_img,
      this.headline,
      this.username,
      this.image,
      this.time,
      this.news});
  final profile_img;
  final headline;
  final username;
  final image;
  final news;
  final time;

  @override
  State<MainNews> createState() => _MainNewsState();
}

class _MainNewsState extends State<MainNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight * 0.55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Color.fromRGBO(217, 217, 217, 0),
                      Color.fromRGBO(0, 0, 0, 1),
                    ]),
                image: DecorationImage(
                    image: NetworkImage(
                      'http://144.91.124.145/~codecha/trigger_news/' +
                          widget.image,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              left: 20,
              top: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 255, 255, 0.43)),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 30,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 255, 255, 0.43)),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            Positioned(
              right: 20,
              left: 20,
              top: 280,
              child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    textScaleFactor: 1.0,
                    "${widget.headline}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            Positioned(
              child: DraggableScrollableSheet(
                initialChildSize: 0.50,
                minChildSize: 0.50,
                maxChildSize: 1,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        controller: scrollController,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25))
                                        ],
                                        shape: BoxShape.circle,
                                        // border: Border.all(
                                        //     color: Color.fromRGBO(0, 0, 0, 0.25)),
                                        color:
                                            Color.fromRGBO(219, 224, 249, 1)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          textScaleFactor: 1.0,
                                          "${widget.username}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 1)),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          textScaleFactor: 1.0,
                                          "${widget.time} hrs ago",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  152, 152, 152, 1)),
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
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
