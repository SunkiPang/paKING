import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/filter_screen.dart';
import 'package:test_flutter/provider/screen_provider.dart';

class ShowGoogleMap extends StatefulWidget {
  Completer<GoogleMapController> _controller = Completer();

  // List<Marker> _markerss = [];
  // BitmapDescriptor _markerIcon;

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  @override
  _ShowGoogleMapState createState() => _ShowGoogleMapState();
}

class _ShowGoogleMapState extends State<ShowGoogleMap> {
  List<bool> _filterValues = [true, true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<ScreenProvider>(context);
    return screen.isMap
        ? Stack(
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
                      setState(() {
                        screen.changeMapFilter();
                      });
                    },
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        : FilterScreen();
  }
}
