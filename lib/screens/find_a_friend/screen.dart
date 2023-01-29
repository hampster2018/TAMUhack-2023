import 'dart:developer';
import 'package:flutter/material.dart';
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: asyncWidget
                  .map((friend) => Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[ Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Expanded(
                                flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                children: <Widget> [
                                  Container(
                                    width: 40,
                                  ),
                                  Image.memory(scale: 10, friend.profilePicturePath),
                                  Container(
                                    width: 20,
                                  ),
                                      Text("${friend.firstName} ${friend.lastName}",
                                          style: TextStyle(fontSize: 24)),
                                  Container(
                                    width: 65,
                                  ),
                                ]
                              ),

                              )//expanded
                            ),),
                          ]),

                        ],
                      ))
                  .toList()),
        ),
      );
    } else {
      list = const Text("Loading");
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/citybg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            centerTitle: true,
            title: const Text("👥 Find Friends"),
          ),
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child:
            Container(
              //color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(15),

              child: Text("Searching in: " + user.company, style: const TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
              ), ),
          ),
          list,
        ],
      )),
    );
  }
}
