import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tamuhack/globals/app_colors.dart';
import '../../globals/user.dart' as user;
import '../../backend/Friend/get_friends.dart';
import '../../backend/Friend/friend.dart';

class FindAFriend extends StatefulWidget {
  const FindAFriend({Key? key}) : super(key: key);

  @override
  State<FindAFriend> createState() => _FindAFriend();
}

class _FindAFriend extends State<FindAFriend> {
  List<Friend> asyncWidget = [];

  @override
  initState() {
    super.initState();

    getFriends().then((result) {
      log(result.toString());
      setState(() {
        asyncWidget = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget list;
    if (asyncWidget.isNotEmpty) {
      list = Expanded(
        flex: 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: asyncWidget
                    .map((friend) => Row(
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Row(children: <Widget>[
                                            Container(
                                              width: 40,
                                            ),
                                            Image.memory(
                                                scale: 10,
                                                friend.profilePicturePath),
                                            Container(
                                              width: 20,
                                            ),
                                            Text(
                                                "${friend.firstName} ${friend.lastName}",
                                                style: TextStyle(fontSize: 24)),
                                            Container(
                                              width: 65,
                                            ),
                                          ]),
                                        ) //expanded
                                        ),
                                  ),
                                ]),
                          ],
                        ))
                    .toList()),
          ),
        ),
      );
    } else {
      list = const Text("Loading");
    }

    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/citybg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            centerTitle: true,
            title: const Text("Find Friends",
                style: TextStyle(color: Color.fromRGBO(182, 31, 35, 1.0))),
            leading: IconButton(
              icon: const Icon(Icons.arrow_circle_left_outlined,
                  color: Color.fromRGBO(182, 31, 35, 1.0), size: 30),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Home');
              },
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white),
                  //color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        VerticalDivider(width: 15),
                        Text("Searching in: " + user.company,
                            style: const TextStyle(
                                fontSize: 22, fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              list,
            ],
          ),
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
    );
  }
}
