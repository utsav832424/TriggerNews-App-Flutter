import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trigger_news_1/citych.dart';

class Selocation extends StatefulWidget {
  const Selocation({super.key, this.stateid});
  final stateid;
  @override
  State<Selocation> createState() => _SelocationState();
}

class _SelocationState extends State<Selocation> {
  String state = "";
  String city = "";
  double? lat;
  double? long;

  Future<Position> getcurrentlocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permission not given");
      LocationPermission asked = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    // print("Longitude" + currentposition.longitude.toString());
    // print("Latitude" + currentposition.latitude.toString());
    // get_address(currentposition.longitude.toDouble(),
    //     currentposition.latitude.toDouble());
  }

  Future getlatlong() async {
    Future<Position> data = getcurrentlocation();
    data.then((value) {
      long = value.longitude;
      lat = value.latitude;
      setState(() {});
      print(long);
      print(lat);
      get_address(value.longitude, value.latitude);
    });
  }

  get_address(long, late) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(late, long);
    state = placemarks[0].administrativeArea!;
    city = placemarks[0].locality!;

    for (int i = 0; i < placemarks.length; i++) {
      print("INDEX $i ${placemarks[i]}");
    }
    print("State" + state);
    print("city" + city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(92, 179, 255, 1),
        title: Text(
          textScaleFactor: 1.0,
          "Your Place",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Color.fromRGBO(92, 179, 255, 1), width: 7)),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromRGBO(92, 179, 255, 1), width: 7)),
                child: Image.asset(
                  'assets/location.png',
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                textScaleFactor: 1.0,
                "Need to get location\nof your mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(92, 179, 255, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                textScaleFactor: 1.0,
                "Allow local apps to use your mobile's location to show news and updates related to your local area",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff797979),
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            OutlinedButton(
              onPressed: () async {
                await getlatlong().then((value) {
                  print(value);
                  if (state.isNotEmpty || city.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => citych(
                          state: state,
                          city: city,
                        ),
                      ),
                    );
                  }
                });
              },
              child: Text(
                textScaleFactor: 1.0,
                "Allow location access",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromRGBO(92, 179, 255, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => citych(stateid: widget.stateid),
                    ));
              },
              child: Text(
                textScaleFactor: 1.0,
                'Choose the location yourself',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(92, 179, 255, 1),
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
