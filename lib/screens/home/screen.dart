import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamuhack/globals/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 100,
                child: const Text("Hello Shamitha",
                    style: TextStyle(fontSize: 40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CupertinoButton(
                        color: AppColors.steelblue,
                        child: const Text('Hotspots'),
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/Hotspots');
                        }),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CupertinoButton(
                        color: AppColors.steelblue,
                        child: const Text('Rideshare'),
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/Rideshare');
                        }),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CupertinoButton(
                        color: AppColors.steelblue,
                        child: const Text('Find a Friend'),
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/FindFriend');
                        }),
                  ),
                ],
              ),
            ),
            // add map widget here
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: AppColors.steelblue,
                  ),
                  //color: AppColors.steelblue,
                  width: 355,
                  height: 400,
                  child: const Image(image: AssetImage('images/map.png'))),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/Home');
                      },
                      icon: const Icon(Icons.home))),
              const SizedBox(width: 5),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/');
                        //Navigator.of(context).pushReplacementNamed('/Rideshare');
                      },
                      icon: const Icon(Icons.car_crash))),
              const SizedBox(width: 5),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                      onPressed: () {
                        //Navigator.of(context).pushReplacementNamed('/FindFriend');
                      },
                      icon: const Icon(Icons.people))),
              const SizedBox(width: 5),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                      onPressed: () {
                        //Navigator.of(context).pushReplacementNamed('/Profile');
                      },
                      icon: const Icon(Icons.person))),
            ],
          ),
        ));
  }
}
