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
                          Image.memory(friend.profilePicturePath),
                          Text("${friend.firstName} ${friend.lastName}")
                        ],
                      ))
                  .toList()),
        ),
      );
    } else {
      list = const Text("Loading");
    }

    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            height: 100,
            child: Text(user.company, style: const TextStyle(fontSize: 40)),
          ),
        ),
        list,
      ],
    ));
  }
}
