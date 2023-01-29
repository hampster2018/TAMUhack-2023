import 'dart:typed_data';
import 'dart:core';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import '../globals/user.dart' as user;

Future<Uint8List> getProfilePicture(String email) async {
  final storageRef = FirebaseStorage.instance.ref();
  String newEmail = email.split('@')[0];
  final pathReference = storageRef.child("profilePictures/ + $newEmail.jpg");
  
  const oneMegabyte = 1024*1024;
  final Uint8List image =
      await pathReference.getData(oneMegabyte) ?? user.defaultProfile;
  return image;
}
