import 'package:animations/animations.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:trigger_news_1/Navbar/create.dart';
import 'package:trigger_news_1/Navbar/home.dart';
import 'package:trigger_news_1/Navbar/notice.dart';
import 'package:trigger_news_1/Navbar/profile.dart';
import 'package:trigger_news_1/Navbar/search.dart';

class Navbar extends StatefulWidget {
  int? i;
  Navbar([this.i]);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final screen = [
    Home(),
    Search(),
    Create(),
    Notice(),
    Profile(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.i != null) {
      _page = widget.i!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: CurvedNavigationBar(
            color: Color.fromRGBO(92, 179, 255, 1),
            index: _page,
            backgroundColor: Colors.transparent,
            items: [
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                label: 'Home',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: 'Search',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: 'Create',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                ),
                label: 'Notice',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                label: 'Profile',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
        body: PageTransitionSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: screen[_page],
        ));
  }
}
