
import 'package:flutter/material.dart';
import 'dart:async';

enum Option {
  A,B,C
}

class SimpleDialogDemo extends StatefulWidget {
  const SimpleDialogDemo({ Key? key }) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {

  String _choice = "Noting";


  Future<void> _openSimpleDialog () async {
    Option _option = await showDialog(
      context: context, 
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Simple Dialog'),
          children: [
            SimpleDialogOption(
              child: Text("Option A"),
              onPressed: () {
                Navigator.of(context).pop(Option.A);
              },
            ),
            SimpleDialogOption(
              child: Text("Option B"),
              onPressed: () {
                Navigator.of(context).pop(Option.B);
              },
            ),
            SimpleDialogOption(
              child: Text("Option C"),
              onPressed: () {
                Navigator.of(context).pop(Option.C);
              },
            ),
          ],
        );
    });
    switch(_option) {
      case Option.A:
        // setState(() {
          _choice = 'A';
        // });
        break;
      case Option.B:
        // setState(() {
          _choice = 'B';
        // });
        break;
      case Option.C:
        // setState(() {
          _choice = 'C';
        // });
        break;
    }
    setState(() {
      _choice;
    });
    return;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your choice is $_choice')
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog
      ),
    );
  }
}
