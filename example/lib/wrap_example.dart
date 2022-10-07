import 'package:flutter/material.dart';

import 'package:reorderables/reorderables.dart';
import 'package:reorderables/jl_photo_view/jl_photo_view.dart';
import 'package:reorderables/jl_photo_view/src/core/jl_photo_view_gesture_allowmultiplegesturerecognizer.dart';
import 'package:reorderables/my_notification.dart';
class WrapExample extends StatefulWidget {
  @override
  _WrapExampleState createState() => _WrapExampleState();
}

class _WrapExampleState extends State<WrapExample> {
  final double _iconSize = 90;
  late List<Widget> _tiles;

  @override
  void initState() {
    super.initState();

    _tiles = <Widget>[
      Container(
        child:NotificationListener<MyNotification>(
          onNotification: (n) {
            print(n.position);
            print(n.rotation);
            return false;
          },
          child: RawGestureDetector(
              gestures: {
                AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<AllowMultipleGestureRecognizer>(
                () => AllowMultipleGestureRecognizer(),
                (AllowMultipleGestureRecognizer instance) {
                  instance.onLongPress = (){

                   setState(() {

                   });

                  };
                }
                )},
                child: Container(
                  height: 100,
                  width: 100,
                  child:PhotoView(
                  imageProvider: AssetImage('assets/river1.jpg'),
                  maxScale: PhotoViewComputedScale.covered * 2.0,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  initialScale: PhotoViewComputedScale.covered,
                  enableRotation: true,
                  enablePanAlways: true,

    //key: ValueKey('river1.jpg'),
                  ),
                ),
        )),
        ),
        Container(
          height: 200,
          width: 200,
          child:PhotoView(
          imageProvider: AssetImage('assets/river1.jpg'),
          maxScale: PhotoViewComputedScale.covered * 2.0,
          minScale: PhotoViewComputedScale.contained * 0.8,
          initialScale: PhotoViewComputedScale.covered,
          enableRotation: true,
          enablePanAlways: true,

    //key: ValueKey('river1.jpg'),
        ),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
      spacing: 8.0,
      runSpacing: 4.0,
      padding: const EdgeInsets.all(8),
      children: _tiles,
      onReorder: _onReorder,
      onNoReorder: (int index) {
        //this callback is optional
        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      },
      onReorderStarted: (int index) {
        //this callback is optional
        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
      }
    );

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        wrap,
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.add_circle),
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                var newTile = Icon(Icons.filter_9_plus, size: _iconSize);
                setState(() {
                  _tiles.add(newTile);
                });
              },
            ),
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.remove_circle),
              color: Colors.teal,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                setState(() {
                  _tiles.removeAt(0);
                });
              },
            ),
          ],
        ),
      ],
    );

    return SingleChildScrollView(
      child: column,
    );

  }
}
