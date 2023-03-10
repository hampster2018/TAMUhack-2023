import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tamuhack/globals/app_colors.dart';
import '../../../backend/Rides/give_ride_class.dart';

class GiveRide extends StatefulWidget {
  const GiveRide({Key? key}) : super(key: key);

  @override
  State<GiveRide> createState() => _GiveRideState();
}

class _GiveRideState extends State<GiveRide> {
  List<DocumentSnapshot> _requestedRides = [];

  void findRides(List<String> day, String destination, String extraTime,
      bool friendsOnly, bool sameGenderOnly) {
    getUserRequest(destination = destination, days = day, extraTime = extraTime,
            friendsOnly = friendsOnly, sameGenderOnly = sameGenderOnly)
        .then((result) => {
              setState(() {
                _requestedRides = result;
              })
            });
  }

  var days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  var passengers = [];

  String dropdownvalue = 'Choose a day';
  String timevalue = 'Choose a time slot';

  var dayVisibility = false;
  var timeVisibility = false;
  var resultVisibility = false;
  var onlyFriends = false;
  var sameGender = false;

  List<String> _selectedDays = [];
  List<String> _selectedTimes = [];

  void _showDaySelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: days);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedDays = results;
      });
    }
  }

  void _showTimeSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> times = ['< 5 min', '5-10 min', '10-15 min', '> 15 min'];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: times);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedTimes = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _destination = TextEditingController();

    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
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
                "Give Ride",
                style: TextStyle(color: Color.fromRGBO(182, 31, 35, 1.0)),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left_outlined,
                    color: Color.fromRGBO(182, 31, 35, 1.0), size: 30),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/FindRide');
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
              //color: Colors.white,
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
                              labelText: 'Destination',
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
                              labelText: 'Destination',
                            ),*/
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
                            enabledBorder: const OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                          ),
                          dropdownColor: AppColors.white,
                          isExpanded: true,
                          value: dropdownvalue,
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'Choose a day',
                              child: Text(
                                'Choose a day',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Monday',
                              child: Text(
                                'Monday',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Tuesday',
                              child: Text(
                                'Tuesday',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Wednesday',
                              child: Text(
                                'Wednesday',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Thursday',
                              child: Text(
                                'Thursday',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Friday',
                              child: Text(
                                'Friday',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
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
                            enabledBorder: const OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                          ),
                          dropdownColor: AppColors.white,
                          isExpanded: true,
                          value: timevalue,
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'Choose a time slot',
                              child: Text(
                                'Choose a time slot',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Very Short',
                              child: Text(
                                '< 5 min',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Short',
                              child: Text(
                                '5-10 min',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Medium',
                              child: Text(
                                '10-15 min',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Long Drive',
                              child: Text(
                                '> 15 min',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 47, 108, 1.0)),
                              ),
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
                      Divider(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        alignment: Alignment.center,
                        width: 340,
                        height: 30,
                        //color: Colors.white,
                        child: Text(
                          'My Riders',
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
                              children: passengers
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
                                    .pushReplacementNamed('/FindRide');
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

// Multi Select widget
// This widget is reusable
class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
