import '../../globals/user.dart' as user;

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> companyLogin(String email, String password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  QuerySnapshot snapshot = await users.where('email', isEqualTo: email).get();

  if (snapshot.docs.length != 1) {
    return [false, "No user exist with that email"];
  }

  DocumentSnapshot data = snapshot.docs[0];

  if (data['password'] != password) {
    return [false, "Password is incorrect"];
  }

  if (data['password'] == password) {
    user.isLoggedIn = true;
    user.first = data['firstName'];
    user.last = data['lastName'];
    user.email = data['email'];
    user.company = data['company'];
    user.interest = List<string>.data['interest'];
    user.friends = List<string>.data['friends'];
    return [true, "Success!"];
  }

  return [false, "Unknown error"];
}
