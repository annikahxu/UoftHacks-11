import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _location = Location();
  GoogleMapController? _controller;
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629); // default position
  bool _loadingInitialPosition = true;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    LocationData _locationData;

    _locationData = await _location.getLocation();
    setState(() {
      _initialcameraposition = LatLng(_locationData.latitude!, _locationData.longitude!);
      _loadingInitialPosition = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingInitialPosition) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _initialcameraposition, zoom: 17.0),
        mapType: MapType.normal,
        onMapCreated: (controller) => _controller = controller,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
