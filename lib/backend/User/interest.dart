import '../../globals/user.dart' as user;
import 'package:cloud_firestore/cloud_firestore.dart';

void updateInterest(String interest) async {
  user.interest.add(interest);
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  QuerySnapshot docs = await users.where(user.email, isEqualTo: 'email').get();

  for (var doc in docs.docs) {
    doc.reference.update({'interest': user.interest});
  }
}
