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

  String dropdownvalue = 'Monday';

  final destination = TextEditingController();
  final timePickup = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
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
                    padding: EdgeInsets.symmetric(vertical: 30),
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
