import 'package:aboutlx/screen/exhibitionMap.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class KMUTTmap extends StatefulWidget {
  @override
  _KMUTTmapState createState() => _KMUTTmapState();
}

class _KMUTTmapState extends State<KMUTTmap> {
  GoogleMapController _controller;
  GoogleMapController myController;
  String _selectedMap = null;

  List<Marker> allMarkers = [];

   Widget popupMennuButton() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.add,size: 30.0),
      itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          value: "Exhibition",
          child: Text("Exhibition Map"),
        ),

        PopupMenuItem<String>(
          value: "KMUTT",
          child: Text("KMUTT Map"),
        ),

      ],
      onSelected: (answer){
        print(answer);
        if(answer == "Exhibition"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ControllerPhotoViewPage()),
            );
        }else if(answer == "KMUTT"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KMUTTmap()),
            );
        }
      },
    );
  }

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
      appBar: AppBar(
        title: Text('KMUTT Map'),
        actions: <Widget>[
          popupMennuButton(),
          // DropdownButton(
          //       value: _selectedMap,
          //       items: _dropDownItem(),
          //       onChanged: (value) {
          //         _selectedMap=value;
          //         switch(value){
          //           case "Exhibition Map" :
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => ControllerPhotoViewPage()),
          //             );
          //             break;
          //           case "KMUTT Map" :
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => KMUTTmap()),
          //             );
          //             break;
          //         }
          //       },
          // )
        ],
      ),
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

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> maps = ['KMUTT Map','Exhibition Map'];
    return maps.map(
            (value) =>
            DropdownMenuItem(
              value: value,
              child: Text(value),
            )
    ).toList();
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  movetoBoston(){
    
  }
}

