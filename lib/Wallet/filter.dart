import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_month_outlined,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[150],
                // border: InputBorder.none,
                // labelText: 'Enter Name',
                hintText: 'From Date',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_month_outlined,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[150],
                // border: InputBorder.none,
                // labelText: 'Enter Name',
                hintText: 'To Date',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                "Submit",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
