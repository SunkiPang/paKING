import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_flutter/paking_class.dart';

import 'detail_dialog.dart';
import 'filter_dialog.dart';

class ShowGoogleMap extends StatefulWidget {
  Completer<GoogleMapController> _controller = Completer();
  List<int> favoriteSample = [2000];

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  @override
  _ShowGoogleMapState createState() => _ShowGoogleMapState();
}

class _ShowGoogleMapState extends State<ShowGoogleMap> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          markers: Set<Marker>.of(widget.markers.values),
          // YOUR MARKS IN MAP
          initialCameraPosition: CameraPosition(
            target: LatLng(36.103591549634345, 129.38800959286618),
            zoom: 17,
          ),
          onMapCreated: (GoogleMapController controller) {
            widget._controller.complete(controller);
          },
          myLocationButtonEnabled: true,
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => detailDialog,
                );
              },
              child: Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
