import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class KMUTTmap extends StatefulWidget {
  @override
  _KMUTTmapState createState() => _KMUTTmapState();
}

class _KMUTTmapState extends State<KMUTTmap> {
  GoogleMapController _controller;
  GoogleMapController myController;

  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: false,
      onTap: () {
        print('Marker Tapped');
      },
      position: LatLng(13.649497, 100.492955)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(13.649497, 100.492955),
                zoom: 12.0,
              ),
              markers: Set.from(allMarkers),
              onMapCreated: mapCreated,
            ),
          ),
        ]
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  movetoBoston(){
    
  }
}

