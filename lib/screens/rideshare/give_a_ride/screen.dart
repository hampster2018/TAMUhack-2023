import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tamuhack/globals/app_colors.dart';

class GiveRide extends StatefulWidget {
  const GiveRide({Key? key}) : super(key: key);

  @override
  _GiveRideState createState() => _GiveRideState();
}

class _GiveRideState extends State<GiveRide> {
  var days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  var passengers = [
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

  String dropdownvalue = 'Choose a day';
  String timevalue = 'Choose a time slot';

  final destination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          centerTitle: true,
          title: const Text("Give Ride"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/FindRide');
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
                        labelText: 'Destination',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        filled: true,
                        fillColor: AppColors.red,
                      ),
                      dropdownColor: AppColors.red,
                      isExpanded: true,
                      value: dropdownvalue,
                      items: const [
                        DropdownMenuItem<String>(
                          child: Text(
                            'Choose a day',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Choose a day',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            'Monday',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Monday',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            'Tuesday',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Tuesday',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            'Wednesday',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Wednesday',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            'Thursday',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Thursday',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            'Friday',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Friday',
                        ),
                      ],
                      onChanged: (String? selectedValue) {
                        if (selectedValue is String) {
                          setState(() {
                            dropdownvalue = selectedValue;
                          });
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        filled: true,
                        fillColor: AppColors.red,
                      ),
                      dropdownColor: AppColors.red,
                      isExpanded: true,
                      value: timevalue,
                      items: const [
                        DropdownMenuItem<String>(
                          child: Text(
                            'Choose a time slot',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Choose a time slot',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            '< 5 min',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Very Short',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            '5-10 min',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Short',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            '10-15 min',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Medium',
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            '> 15 min',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'Long ass drive',
                        ),
                      ],
                      onChanged: (String? selectedValue) {
                        if (selectedValue is String) {
                          setState(() {
                            timevalue = selectedValue;
                          });
                        }
                      },
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
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: passengers
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
