import 'package:flutter/material.dart';
import '../../globals/user.dart' as user;

import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserID extends StatelessWidget {
  final String email;
  final String password;

  GetUserID(this.email, this.password) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<QuerySnapshot>(
      future: users
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
          if (data['password'] == password) {
            user.isLoggedIn = true;
            user.uid = data['uid'];
            user.first = data['firstName'];
            user.last = data['lastName'];
            user.email = data['email'];
            user.company = data['company'] ?? "None";
            user.interest = data['interest'];
            user.friends = data['friends'];
            return const Text("Login successful");
          }
          return const Text("Incorrect Password");
        }

        return const Text("loading");
      },
    );
  }
}
