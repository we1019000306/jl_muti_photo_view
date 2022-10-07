import 'package:flutter/material.dart';

import 'package:reorderables/reorderables.dart';
import 'package:photo_view/photo_view.dart';

class RowExample extends StatefulWidget {
  @override
  _RowExampleState createState() => _RowExampleState();
}

class _RowExampleState extends State<RowExample> {
  late List<Widget> _columns;

  @override
  void initState() {
    super.initState();
    _columns = <Widget>[
      // Image.asset('assets/river1.jpg', key: ValueKey('river1.jpg')),
      // Image.asset('assets/river2.jpg', key: ValueKey('river2.jpg')),
      // Image.asset('assets/river3.jpg', key: ValueKey('river3.jpg')),
      // Image.asset('assets/river1.jpg', key: ValueKey('river1.jpg')),
      // Image.asset('assets/river2.jpg', key: ValueKey('river2.jpg')),
     // Image.asset('assets/river3.jpg', key: ValueKey('river3.jpg')),
      PhotoView(
          imageProvider: AssetImage('assets/river1.jpg'),
          key: ValueKey('river1.jpg'),
          customSize: Size.square(170.0),
      ) ,
      // PhotoView(
      //   imageProvider: AssetImage('assets/river2.jpg'),
      //   key: ValueKey('river2.jpg'),
      // ),
      // PhotoView(
      //   imageProvider: AssetImage('assets/river3.jpg'),
      //   key: ValueKey('river3.jpg'),
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget col = _columns.removeAt(oldIndex);
        _columns.insert(newIndex, col);
      });
    }

    return ReorderableRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _columns,
      onReorder: _onReorder,
      onNoReorder: (int index) {
        //this callback is optional
        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      },
    );
  }
}
