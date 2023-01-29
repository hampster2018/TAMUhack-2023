import 'dart:typed_data';
import 'dart:core';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import '../globals/user.dart' as user;
import 'dart:developer';

Future<Uint8List> getProfilePicture(String email) async {
  final storageRef = FirebaseStorage.instance.ref();
  String newEmail = email.split('@')[0];
  String path = "profilePictures/$newEmail.jpg";
  log(path);
  final pathReference = storageRef.child(path);

  const oneMegabyte = 1024 * 1024;
  final Uint8List image =
      await pathReference.getData(oneMegabyte) ?? user.defaultProfile;

  return image;
}
