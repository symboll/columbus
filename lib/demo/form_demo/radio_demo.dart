

import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({ Key? key }) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {

  int _radioGroupA = 0;
  int _radioGroupB = 0;
  void _radioAChange (value) {
    setState(() {
      _radioGroupA = value!;
    });
  }
  void _radioBChange (value) {
    setState(() {
      _radioGroupB = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RadioDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0, 
                  groupValue: _radioGroupA, 
                  onChanged: _radioAChange
                ),
                Radio(
                  value: 1, 
                  groupValue: _radioGroupA, 
                  onChanged: _radioAChange
                ),
              ],
            ),
            RadioListTile(
              value: 0, 
              groupValue: _radioGroupB, 
              onChanged: _radioBChange,
              title: Text('Option A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupB == 0,
            ),
            RadioListTile(
              value: 1, 
              groupValue: _radioGroupB, 
              onChanged: _radioBChange,
              title: Text('Option B'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_2),
              selected: _radioGroupB == 1,
            )
          ],
        ),
      ),
    );
  }
}