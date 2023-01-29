import 'package:cloud_firestore/cloud_firestore.dart';
import '../../globals/user.dart' as user;
import '../User/user.dart';

Future<List<DocumentSnapshot>> getUserRequest(
    String destination,
    List<String> days,
    String extraTime,
    bool friendOnly,
    bool sameGenderOnly) async {
  CollectionReference needRides =
      FirebaseFirestore.instance.collection('needRides');

  List<DocumentSnapshot> requested = [];

  for (String day in days) {
    QuerySnapshot snapshot = await needRides
        .where(destination, isEqualTo: 'destination')
        .where(day, isEqualTo: 'day')
        .limit(5)
        .get();

    List<DocumentSnapshot> docs = snapshot.docs;

    for (var doc in docs) {
      requested.add(doc);
    }
  }

  return requested;
}
