
import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({ Key? key }) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey<ScaffoldState>();
  String _selectedValue = '';


  Future<void> _openBottomSheet () async {
    _scaffoldStateKey.currentState?.showBottomSheet((BuildContext context) => BottomAppBar(
      child: Container(
        height: 90.0,
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Row(
          children:const [
            Icon(Icons.pause_circle_outline),
            SizedBox(width: 16.0,),
            Text('01:30 / 03:30'),
            Expanded(
              child: Text('Fix - you Coldplay', textAlign: TextAlign.right,)
            )
          ],
        ),
      ),
    )); 
  }

  Future<void> _openModalBottomSheet () async {
    String _result = await showModalBottomSheet(
      context: context, 
      builder: (BuildContext context) => Container(
        height: 200.0,
        child: Column(
          children: [
            ListTile(
              title: Text('Option A'),
              onTap: () {
                Navigator.of(context).pop("A");
              },
            ),
            ListTile(
              title: Text('Option B'),
              onTap: () {
                Navigator.of(context).pop("B");
              },
            ),
            ListTile(
              title: Text('Option C'),
              onTap: () {
                Navigator.of(context).pop("C");
              },
            )
          ],
        ),
      )
    );
    setState(() {
      _selectedValue = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
      appBar: AppBar(
        title: const Text('BottomSheetDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Open Bottom Sheet'),
                  onPressed: _openBottomSheet
                )
              ],
            ),
            SizedBox(height: 32.0,),
            Text('your selected is: $_selectedValue'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Open Modal Bottom Sheet'),
                  onPressed: _openModalBottomSheet
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}