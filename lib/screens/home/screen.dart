import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tamuhack/globals/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double lat;
  late double long;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  late double lati;
  late double longi;

  LatLng getLatLong() {
    lat = 30.611560198615287;
    long = -96.341671918995;
    Future<Position> data = _determinePosition();
    data.then((value) {
      print("value $value");
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });

      //getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      print("Error $error");
    });
    return LatLng(lat, long);
  }

  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(30.6131, -96.3447),
        infoWindow: InfoWindow(
          title: 'The Albritton Bell Tower',
        )),
    const Marker(
        markerId: MarkerId('2'),
        position: LatLng(30.6101, -96.3401),
        infoWindow: InfoWindow(
          title: 'Kyle Field',
        )),
    const Marker(
        markerId: MarkerId('3'),
        position: LatLng(30.6227, -96.3352),
        infoWindow: InfoWindow(
          title: 'Bonfire Memorial',
        )),
    const Marker(
        markerId: MarkerId('4'),
        position: LatLng(30.5987, -96.3322),
        infoWindow: InfoWindow(
          title: 'W.A. Tarrow Park',
        )),
    const Marker(
        markerId: MarkerId('5'),
        position: LatLng(30.6362, -96.3659),
        infoWindow: InfoWindow(
          title: 'BigShots Golf',
        )),
  ];

  late GoogleMapController mapController;
  final LatLng _center = LatLng(30.611560198615287, -96.341671918995);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blue,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 100,
                child: Text("Hello Shamitha",
                    style: TextStyle(color: AppColors.white, fontSize: 40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.steelblue),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text('Hotspots',
                                  style: TextStyle(color: AppColors.red)),
                            ),
                            SizedBox(height: 5),
                            Icon(Icons.location_city_rounded,
                                size: 50, color: AppColors.red)
                          ],
                        ),
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/Hotspots');
                        }),
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.steelblue),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text('Rideshare',
                                  style: TextStyle(color: AppColors.red)),
                            ),
                            SizedBox(height: 5),
                            Icon(Icons.directions_car_rounded,
                                size: 50, color: AppColors.red)
                          ],
                        ),
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/Hotspots');
                        }),
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.steelblue),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text('Find Friends',
                                  style: TextStyle(color: AppColors.red)),
                            ),
                            SizedBox(height: 5),
                            Icon(Icons.emoji_people_rounded,
                                size: 50, color: AppColors.red)
                          ],
                        ),
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/Hotspots');
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
                child: Text('Hotspots Near Me',
                    style: TextStyle(color: AppColors.white, fontSize: 25))),
            // add map widget here
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.steelblue,
                ),
                //color: AppColors.steelblue,
                width: 355,
                height: 400,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  markers: Set<Marker>.of(_markers),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  compassEnabled: true,
                ),

                //Image(image: AssetImage('images/map.png'))
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Container(
            height: 80,
            color: AppColors.lightblue.withOpacity(.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/Home');
                        },
                        icon: Icon(Icons.home),
                        color: AppColors.white)),
                SizedBox(width: 5),
                SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                          //Navigator.of(context).pushReplacementNamed('/Rideshare');
                        },
                        icon: Icon(Icons.directions_car),
                        color: AppColors.white)),
                SizedBox(width: 5),
                SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/MyFriends');
                        },
                        icon: Icon(Icons.people),
                        color: AppColors.white)),
                SizedBox(width: 5),
                SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {
                          //Navigator.of(context).pushReplacementNamed('/Profile');
                        },
                        icon: Icon(Icons.person),
                        color: AppColors.white)),
              ],
            ),
          ),
        ));
  }
}
