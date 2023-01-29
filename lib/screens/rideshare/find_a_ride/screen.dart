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

  final TextEditingController pickUp = TextEditingController();
  final TextEditingController timePickup = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController dropOff = TextEditingController();

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
                    child: CupertinoTextField(
                      controller: pickUp,
                      placeholder: 'Enter Pickup Destination',
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: CupertinoTextField(
                      controller: dropOff,
                      placeholder: 'Enter Drop-off Destination',
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  SizedBox(
                    width: sWidth / 1.2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: sWidth / 2.5,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        AppColors.lightblue, // Background color
                                  ),
                                  child: Text(
                                      '${dateTime.month}/${dateTime.day}/${dateTime.year}'),
                                  onPressed: () async {
                                    final chosenDate = await pickDate();
                                    if (chosenDate == null) return;
                                    setState(() {
                                      dateTime = chosenDate;
                                    });
                                  })),
                          SizedBox(
                              width: sWidth / 2.5,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        AppColors.lightblue, // Background color
                                  ),
                                  child: Text('${hours}:${minutes}'),
                                  onPressed: () async {
                                    final chosenTime = await pickTime();
                                    if (chosenTime == null) return;
                                    final newDateTime = DateTime(
                                        dateTime.year,
                                        dateTime.month,
                                        dateTime.day,
                                        chosenTime.hour,
                                        chosenTime.minute);
                                    setState(() {
                                      dateTime = newDateTime;
                                    });
                                  }))
                        ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  CupertinoButton(
                      color: AppColors.lightblue,
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: sHeight * 0.0015,
                          fontSize: 26.0,
                        ),
                      ),
                      onPressed: () {
                        makeRide(pickUp.text, dropOff.text, date.text,
                            timePickup.text, false, false);
                      }),
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
                          children: drivers
                              .map<Widget>((word) => Container(
                                  color: AppColors.lightblue,
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
