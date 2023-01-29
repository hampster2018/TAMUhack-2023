import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamuhack/globals/app_colors.dart';
import '../../../backend/Rides/find_ride_class.dart';

class FindRide extends StatefulWidget {
  const FindRide({Key? key}) : super(key: key);

  @override
  State<FindRide> createState() => _FindRideState();
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

  DateTime dateTime = DateTime.now();

  final pickUp = TextEditingController();
  final timePickup = TextEditingController();
  final date = TextEditingController();
  final dropOff = TextEditingController();

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/citybg.jpg"),
              fit: BoxFit.cover,
              opacity: .6),
        ),
        child: Scaffold(
            backgroundColor: AppColors.blue.withOpacity(.2),
            appBar: AppBar(
              backgroundColor: AppColors.white.withOpacity(.95),
              centerTitle: true,
              title: const Text(
                "Find Ride",
                style: TextStyle(color: Color.fromRGBO(182, 31, 35, 1.0)),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left_outlined,
                    color: Color.fromRGBO(182, 31, 35, 1.0), size: 30),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/GiveRide');
                },
              ),
            ),
            body: Center(
                child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/citybg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              width: sWidth,
              height: sHeight,
              //color: AppColors.blue,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Container(
                        color: AppColors.white,
                        child: SizedBox(
                          width: sWidth / 1.2,
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Pick Up Destination',
                              enabledBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),

                            /*InputDecoration(
                              //border: OutlineInputBorder(),
                              labelText: 'Pick Up Destination',
                            ),*/
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Container(
                        color: AppColors.white,
                        child: SizedBox(
                          width: sWidth / 1.2,
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Pick Up Time (Military Time)',
                              enabledBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),

                            /*InputDecoration(
                              //border: OutlineInputBorder(),
                              labelText: 'Enter Pick Up Time (Military Time)',
                            ),*/
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Container(
                        color: AppColors.white,
                        child: SizedBox(
                          width: sWidth / 1.2,
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Date',
                              enabledBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),

                            /*InputDecoration(
                              //border: OutlineInputBorder(),
                              labelText: 'Enter Date',
                            ),*/
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Container(
                        color: AppColors.white,
                        child: SizedBox(
                          width: sWidth / 1.2,
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter Drop Off Destination',
                              enabledBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),

                            /*InputDecoration(
                              //border: OutlineInputBorder(),
                              labelText: 'Enter Drop Off Destination',
                            ),*/
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      CupertinoButton(
                          color: AppColors.red,
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
                      const Divider(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        alignment: Alignment.center,
                        width: 340,
                        height: 30,
                        //color: Colors.white,
                        child: Text(
                          'My Rides',
                          style:
                              TextStyle(fontSize: 20, color: AppColors.black),
                        ),
                      ),
                      Divider(),
                      Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              spacing: 20.0,
                              runSpacing: 10.0,
                              children: drivers
                                  .map<Widget>((word) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.lightblue),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10.0),
                                      //color: AppColors.lightblue,
                                      width: sWidth / 2.55,
                                      height: 100,
                                      child: Text(
                                        word,
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 20),
                                      )))
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
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  height: 80,
                  color: AppColors.white.withOpacity(.85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/Home');
                              },
                              icon: const Icon(Icons.home, size: 35),
                              color: AppColors.blue)),
                      const Divider(),
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/GiveRide');
                                //Navigator.of(context).pushReplacementNamed('/Rideshare');
                              },
                              icon: const Icon(Icons.directions_car, size: 35),
                              color: AppColors.blue)),
                      const Divider(),
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: IconButton(
                              onPressed: () {
                                //Navigator.of(context).pushReplacementNamed('/MyFriends');
                              },
                              icon: const Icon(Icons.people, size: 35),
                              color: AppColors.blue)),
                      const Divider(),
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/Profile');
                              },
                              icon: const Icon(Icons.person, size: 35),
                              color: AppColors.blue)),
                    ],
                  ),
                ))),
      ),
    );
  }
}
