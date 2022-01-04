

import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({ Key? key }) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {

  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliderDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Silder Value: $_sliderValue'),
            SizedBox(height: 16.0,),
            Slider(
              value: _sliderValue, 
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Theme.of(context).primaryColor.withOpacity(0.2),
              min: 0.0,
              max: 10.0,
              divisions: 10,
              label: '${_sliderValue.toInt()}',
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              }
            )
          ],
        ),
      ),
    );
  }
}