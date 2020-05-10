import 'package:aboutlx/screen/KMUTTmap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';


class ControllerPhotoViewPage extends StatefulWidget {

  @override
  _ControllerPhotoViewPageState createState() => _ControllerPhotoViewPageState();
}

class _ControllerPhotoViewPageState extends State<ControllerPhotoViewPage> {
  PhotoViewController photoViewController;
  String _selectedMap = null;

  @override
  void initState() {
    super.initState();
    photoViewController = PhotoViewController();
  }

  @override
  void dispose() {
    super.dispose();
    photoViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exhibition Map'),
        actions: <Widget>[

          DropdownButton(
                value: _selectedMap,
                items: _dropDownItem(),
                onChanged: (value) {
                  _selectedMap=value;
                  switch(value){
                    case "Exhibition Map" :
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ControllerPhotoViewPage()),
                      );
                      break;
                    case "KMUTT Map" :
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KMUTTmap()),
                      );
                      break;
                  }
                },
          )
        ],
      ),
      
      body: Stack(
        children: <Widget>[
          _buildPhotoView(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildScaleInfo(),
              _buildResetScaleButton(),
            ],
          )
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

  PhotoView _buildPhotoView(BuildContext context) {
    return PhotoView(
      controller: photoViewController,
      imageProvider: AssetImage("images/LXFloorPlanwFn.png",
      ),
      minScale : PhotoViewComputedScale.contained * 0.8,
      maxScale : PhotoViewComputedScale.covered * 2,
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      loadingChild: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  StreamBuilder<PhotoViewControllerValue> _buildScaleInfo() {
    return StreamBuilder(
      stream: photoViewController.outputStateStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<PhotoViewControllerValue> snapshot,
    )
     {
      if (!snapshot.hasData) return Container();
      return Center(
        // child: Text(
        //   'Scale compared to the original: \n${snapshot.data.scale}',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(fontSize: 20),
        // ),
      );
    },
    );
  }

  RaisedButton _buildResetScaleButton() {
    return RaisedButton(
      child: Text('Reset Scale'),
      onPressed: () {
        photoViewController.scale = photoViewController.initial.scale;
      },
    );
  }

}

class ClippedPhotoViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRect(
            child: PhotoView(
              imageProvider: AssetImage("images/LXFloorPlanwFn.png",
              ),
              minScale : PhotoViewComputedScale.contained * 0.8,
              maxScale : PhotoViewComputedScale.covered * 2,
              enableRotation: true,
              loadingChild: Center(
                child: CircularProgressIndicator(),
              ),
              ),
            ),
          ),
        ), 
      );
  }
}

  