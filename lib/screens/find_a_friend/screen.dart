import 'package:flutter/material.dart';
import '../../globals/user.dart' as user;

class FindAFriend extends StatefulWidget {
  const FindAFriend({Key? key}) : super(key: key);

  @override
  State<FindAFriend> createState() => _FindAFriend();
}

class _FindAFriend extends State<FindAFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            height: 100,
            child: const Text(user.company, style: TextStyle(fontSize: 40)),
          ),
        )
        FutureBuilder(
          future: 
          builder: builder)
      ],
    ));
  }
}

