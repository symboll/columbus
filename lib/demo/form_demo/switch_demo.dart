

import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({ Key? key }) : super(key: key);

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {

  bool _switchValue = false;
  void _switchValueChange (value) {
    setState(() {
      _switchValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SwitchDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: _switchValue, 
              onChanged: _switchValueChange
            ),
            SwitchListTile(
              value: _switchValue, 
              onChanged: _switchValueChange,
              title: Text('Switch Item'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.sd_card),
              selected: _switchValue,
            )
          ],
        ),
      ),
    );
  }
}