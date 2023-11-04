// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:maplocation/custom.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  Location? _location;
  LocationData? _currentLocation;
   TextEditingController yourNameController = TextEditingController();
   TextEditingController toNameController = TextEditingController();



  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    _location = Location();
    _cameraPosition = const CameraPosition(
        target: LatLng(0, 0),
        zoom: 15
    );
    _initLocation();
  }


  _initLocation() {
    //use this to go to current location instead
    _location?.getLocation().then((location) {
      _currentLocation = location;
    });
    _location?.onLocationChanged.listen((newLocation) {
      _currentLocation = newLocation;
      moveToPosition(LatLng(_currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0));
    });
  }

  moveToPosition(LatLng latLng) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: latLng,
                zoom: 15
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(),
      ),
    );
  }

  Widget buildBody(){
    return getMap();
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0,3),
                spreadRadius: 4,
                blurRadius: 6
            )
          ]
      ),
      child:  const ClipOval(child: Icon(Icons.accessibility_new_outlined)),
    );
  }

  Widget getMap(){
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition!,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            // now we need a variable to get the controller of google map
            if (!_googleMapController.isCompleted) {
              _googleMapController.complete(controller);
            }
          },


        ),
        Positioned(
          top: 30,
          left: 20,
          right: 20,
          child:  Column(
            children: [
              TextFielWidget(
                  isRequired: true,
                  readOnly: false,
                  filled: true,
                  controller:yourNameController,
                  hintText: 'your_name_hint',
                  obsecureText: false,
                  visibility: const SizedBox(),
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'your_name_empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  onChanged: (val) {
                    return ' ';
                  },
                  autofocus: false),
              SizedBox(
                height: 15,
              ),
              TextFielWidget(
                  isRequired: true,
                  readOnly: false,
                  filled: true,
                  controller:toNameController,
                  hintText: 'your_name_hint',
                  obsecureText: false,
                  visibility: const SizedBox(),
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'your_name_empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  onChanged: (val) {
                    return ' ';
                  },
                  autofocus: false),
            ],
          ),
        ),
        Positioned.fill(
            child: Align(
                alignment: Alignment.topRight,
                child: _getMarker()
            )
        )
      ],
    );
  }
}
