import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;

class MapSample extends StatefulWidget {
  final Function updateMarker;
  final Function updateZoom;
  final CameraPosition cameraPosition;
  MapSample({this.updateMarker, this.updateZoom, this.cameraPosition});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  List<Marker> markers = [];

  _handleTap(LatLng tappedPoint) {
    setState(() {
      markers = [];
      markers.add(
        Marker(
            markerId: MarkerId(
              tappedPoint.toString(),
            ),
            position: tappedPoint),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add location',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          MyCustomMap(
              markers: markers,
              handleTap: _handleTap,
              cameraPosition: widget.cameraPosition),
          Positioned(
            bottom: 0,
            left: 125,
            child: FlatButton(
              onPressed: () {
                firestore.collection('users').doc(firebaseUser.uid).set(
                    {"location": markers[0].toJson()}, SetOptions(merge: true));
                widget.updateMarker(markers[0]);
                Navigator.pop(context);
              },
              child: Text(
                'save',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomMap extends StatelessWidget {
  const MyCustomMap({
    Key key,
    @required this.markers,
    this.handleTap,
    this.zoomControlsEnabled = true,
    this.cameraPosition,
    this.zoom,
    this.updateZoom,
  }) : super(key: key);

  final Function handleTap;
  final Function updateZoom;
  final bool zoomControlsEnabled;
  final List<Marker> markers;
  final CameraPosition cameraPosition;
  final double zoom;

  void _onGeoChanged(CameraPosition position) {
    firestore
        .collection('users')
        .doc(firebaseUser.uid)
        .set({'zoom': position.zoom}, SetOptions(merge: true));
    updateZoom(position.zoom);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition,
      onTap: handleTap,
      markers: Set.from(markers),
      zoomControlsEnabled: zoomControlsEnabled,
      onCameraMove: _onGeoChanged,
    );
  }
}
