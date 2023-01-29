import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:tamuhack/globals/app_colors.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';
import '../../globals/user.dart' as user;
import '../../backend/User/interest.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> _myInterests = user.interest;

  void addInterest(String interest) {
    _myInterests.add(interest);
    updateInterest(interest);
    setState(() {
      _myInterests.add(interest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/citybg.jpg"),
            fit: BoxFit.cover,
            opacity: .6),
      ),
      child: Scaffold(
          backgroundColor: AppColors.red.withOpacity(.2),
          appBar: AppBar(
            backgroundColor: AppColors.white.withOpacity(.95),
            centerTitle: true,
            title: const Text(
              "Profile",
              style: TextStyle(color: Color.fromRGBO(182, 31, 35, 1.0)),
            ),
            leading: IconButton(
              icon: const Icon(Icons.settings_outlined,
                  color: Color.fromRGBO(182, 31, 35, 1.0), size: 30),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Image(image: AssetImage('images/example1.jpg'))

                    /*Text('ST',
                      style: TextStyle(fontSize: 50, color: AppColors.red)),*/
                    ),*/
                CircularProfileAvatar(
                  '',
                  radius: 65, // sets radius, default 50.0
                  initialsText: Text(
                    "ST",
                    style: TextStyle(fontSize: 60, color: AppColors.red),
                  ),
                  borderWidth: 3,
                  borderColor: AppColors.blue,
                  foregroundColor: AppColors.white.withOpacity(0.5),
                  cacheImage:
                      true, // allow widget to cache image against provided url
                  showInitialTextAbovePicture:
                      true, //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                  child: Image(
                      image: AssetImage(
                          'images/example.jpg')), // setting it true will show initials text above profile picture, default false
                ),
                Column(
                  children: [
                    Text(
                      'User',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(height: 5),
                    Container(
                      alignment: Alignment.center,
                      width: 350,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightblue,
                      ),
                      //color: AppColors.lightblue,
                      child: Text(
                        'Shamitha Thumma',
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Organization',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(height: 5),
                    Container(
                      alignment: Alignment.center,
                      width: 350,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightblue,
                      ),
                      //color: AppColors.lightblue,
                      child: Text(
                        'TAMUHack Inc.',
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Role',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(height: 5),
                    Container(
                      alignment: Alignment.center,
                      width: 350,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightblue,
                      ),
                      //color: AppColors.lightblue,
                      child: Text(
                        'Junior Developer',
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white.withOpacity(.85),
                  ),
                  width: 350,
                  child: ChipTags(
                    list: _myInterests,
                    createTagOnSubmit: true,
                    decoration: const InputDecoration(
                      hintText: "Add Interests",
                    ),
                    chipColor: Color.fromRGBO(182, 31, 35, 1.0),
                  ),
                ),
              ]),
          bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                height: 80,
                color: AppColors.white.withOpacity(.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/Home');
                            },
                            icon: const Icon(Icons.home, size: 35),
                            color: AppColors.blue)),
                    const Divider(),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/FindRide');
                              //Navigator.of(context).pushReplacementNamed('/Rideshare');
                            },
                            icon: const Icon(Icons.directions_car, size: 35),
                            color: AppColors.blue)),
                    const Divider(),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: IconButton(
                            onPressed: () {
                              //Navigator.of(context).pushReplacementNamed('/MyFriends');
                            },
                            icon: const Icon(Icons.people, size: 35),
                            color: AppColors.blue)),
                    const Divider(),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/Profile');
                            },
                            icon: const Icon(Icons.person, size: 35),
                            color: AppColors.blue)),
                  ],
                ),
              ))),
    );
  }
}
