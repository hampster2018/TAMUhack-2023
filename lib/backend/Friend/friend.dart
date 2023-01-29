// Basic information of friends
import 'dart:typed_data';

class Friend {
  final String firstName;
  final String lastName;
  final List interest;
  final Uint8List profilePicturePath;

  Friend(this.firstName, this.lastName, this.interest, this.profilePicturePath);
}
