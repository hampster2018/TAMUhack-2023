import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamuhack/globals/app_colors.dart';

class FindRide extends StatefulWidget {
  const FindRide({Key? key}) : super(key: key);

  @override
  _FindRideState createState() => _FindRideState();
}

class _FindRideState extends State<FindRide> {
  var days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  var drivers = [
    "Manish",
    "Eric",
    "Shamitha",
    "Avani",
    "Sandeep",
    "Reshvar",
    "Rohit",
    "Rohan",
    "Sahil"
  ];

  String dropdownvalue = 'Monday';

  final pickUp = TextEditingController();
  final timePickup = TextEditingController();
  final date = TextEditingController();
  final dropOff = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          centerTitle: true,
          title: const Text("Find Ride"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/GiveRide');
            },
          ),
        ),
        body: Center(
            child: Container(
          width: sWidth,
          height: sHeight,
          color: Colors.white,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pick Up Destination',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter time to be picked up (military time)',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter date',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter drop off destination',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  CupertinoButton(
                      color: AppColors.blue,
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: sHeight * 0.0015,
                          fontSize: 26.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {}),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                  ),
                  Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: drivers
                              .map<Widget>((word) => Container(
                                  color: Colors.blue,
                                  width: sWidth / 2.4,
                                  height: 100,
                                  child: Text(word)))
                              .toList(),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
