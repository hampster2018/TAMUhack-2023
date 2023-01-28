import 'package:flutter/material.dart';
import '../../globals/user.dart' as user;

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddInterest extends StatelessWidget {
  final String interest;

  AddInterest(this.interest) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      user.interest.add(interest);
      return users
          .doc(user.uid)
          .set(
            {'interest': user.interest},
            SetOptions(merge: true),
          )
          .then((value) => print("$interest added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: const Text(
        "Add User",
      ),
    );
  }
}
