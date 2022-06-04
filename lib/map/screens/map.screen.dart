import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapToolbarEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _here,
        label: const Text('Here'),
        icon: const Icon(Icons.home),
      ),
    );
  }

  Future<void> _here() async {
    Position position = await determinePosition();

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        
        target: LatLng(position.latitude, position.latitude),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414)));
  }
}
