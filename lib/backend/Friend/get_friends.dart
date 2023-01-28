import './friend.dart';
import '../../globals/user.dart' as user;
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> login() async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  if (user.friends.isEmpty) {
    QuerySnapshot snapshot =
        await users.where('email', isEqualTo: user.email).get();

    if (snapshot.docs.isEmpty) {
      log("User doesn't exist");
    }

    DocumentSnapshot<Object?> data = snapshot.docs[0];

    user.friends = data['friends'];

    if (user.friends.isEmpty) {
      log("User has no friends");
      return [];
    }
  }

  QuerySnapshot snapshot =
      await users.where('email', whereIn: user.friends).limit(10).get();

  List<DocumentSnapshot<Object?>> data = snapshot.docs;

  List<Friend> friends = [];
  for (int i = 0; i < data.length; i++) {
    friends.add(
        Friend(data[i]['firstName'], data[i]['lastName'], data[i]['interest']));
  }

  return friends;
}
