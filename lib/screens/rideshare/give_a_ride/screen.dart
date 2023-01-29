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

  var passengers = [];

  String dropdownvalue = 'Choose a day';
  String timevalue = 'Choose a time slot';

  var dayVisibility = false;
  var timeVisibility = false;
  var resultVisibility = false;
  var onlyFriends = false;
  var sameGender = false;

  final destination = TextEditingController();

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
                    padding: EdgeInsets.symmetric(vertical: 5),
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
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: ElevatedButton(
                      onPressed: _showDaySelect,
                      child: const Text('Select Your Days to Drive'),
                    ), /*DropdownButtonFormField(
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
                    ),*/
                  ),
                  Wrap(
                    children: _selectedDays
                        .map((e) => Chip(
                              label: Text(e),
                            ))
                        .toList(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: ElevatedButton(
                      onPressed: _showTimeSelect,
                      child: const Text('Select Your Time Rides'),
                    ), /*DropdownButtonFormField(
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
                    ),*/
                  ),
                  Wrap(
                    children: _selectedTimes
                        .map((e) => Chip(
                              label: Text(e),
                            ))
                        .toList(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: sWidth / 2.6,
                            child: CheckboxListTile(
                                title: Text("Friends Only"),
                                activeColor: AppColors.blue,
                                checkColor: Colors.white,
                                selectedTileColor: Colors.blue,
                                selected: onlyFriends,
                                value: onlyFriends,
                                onChanged: (value) {
                                  setState(() {
                                    onlyFriends = value!;
                                  });
                                  //if (value != null) sameGender = value;
                                })),
                        SizedBox(
                            width: sWidth / 2.6,
                            child: CheckboxListTile(
                                title: Text("Same Gender"),
                                activeColor: AppColors.blue,
                                checkColor: Colors.white,
                                selectedTileColor: Colors.green,
                                selected: sameGender,
                                value: sameGender,
                                onChanged: (value) {
                                  setState(() {
                                    sameGender = value!;
                                  });
                                  //if (value != null) sameGender = value;
                                })),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
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
                      onPressed: () {
                        setState(() {
                          if (_selectedDays.isNotEmpty &&
                              _selectedTimes.isNotEmpty) {
                            dayVisibility = false;
                            timeVisibility = false;
                            resultVisibility = true;
                            passengers = [
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
                          } else {
                            resultVisibility = false;
                            if (_selectedDays.isEmpty)
                              dayVisibility = true;
                            else
                              dayVisibility = false;
                            if (_selectedTimes.isEmpty)
                              timeVisibility = true;
                            else
                              timeVisibility = false;
                          }
                        });
                      }),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                  Visibility(
                    visible: dayVisibility,
                    child: Text(
                      "Please choose a day",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.red),
                    ),
                  ),
                  /*const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),*/
                  Visibility(
                    visible: timeVisibility,
                    child: Text(
                      "Please choose a time amount",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.red),
                    ),
                  ),
                  Visibility(
                    visible: resultVisibility,
                    child: Expanded(
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
                                    child: Center(
                                        child: Text(word,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center))))
                                .toList(),
                          ),
                        )),
                  ),
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
