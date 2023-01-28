import 'package:flutter/material.dart';
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

  String dropdownvalue = 'Monday';

  final destination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          title: const Text("Give Ride"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            onPressed: () {},
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
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownvalue,
                      items: const [
                        DropdownMenuItem<String>(
                          child: Text('Monday'),
                          value: 'Monday',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Tuesday'),
                          value: 'Tuesday',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Wednesday'),
                          value: 'Wednesday',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Thursday'),
                          value: 'Thursday',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Friday'),
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
