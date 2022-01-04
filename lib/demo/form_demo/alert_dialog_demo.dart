
import 'package:flutter/material.dart';


enum Action {
  OK,Cancel
}

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({ Key? key }) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _selectedValue = '';

  Future<void> _openAlertDialog () async {
    Action result = await showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Text('Are you sure about this?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(Action.Cancel);
              }, 
            ),
            ElevatedButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop(Action.OK);
              }, 
            ),
          ],
        );
    });

    switch (result) {
      case Action.OK:
        _selectedValue = "OK";
        break;
      case Action.Cancel:
        _selectedValue = "Cancel";
        break;
    }
    setState(() {
      _selectedValue: _selectedValue;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialogDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('your choise is $_selectedValue'),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ElevatedButton(
                  child: Text('Open Alert Dialog'),
                  onPressed: _openAlertDialog
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}