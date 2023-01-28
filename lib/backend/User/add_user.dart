import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String company;
  final String password;

  AddUser(this.firstName, this.lastName, this.email, this.password,
      [this.company = "None"])
      : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return users
          .add({
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'company': company,
            'password': password
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
        onPressed: addUser,
        child: const Text(
          "Add User",
        ));
  }
}
