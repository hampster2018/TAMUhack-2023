import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import '../globals/user.dart' as user;

const oneMegabyte = 1024 * 1024;

Future<Uint8List> getProfilePicture(email) async {
  final storageRef = FirebaseStorage.instance.ref();

  final pathReference = storageRef.child("profilePictures/$email.jpg");
  final Uint8List image =
      await pathReference.getData(oneMegabyte) ?? user.defaultProfile;
  return image;
}
