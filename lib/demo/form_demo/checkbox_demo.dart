
import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({ Key? key }) : super(key: key);

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  // bool _checkboxItemA = true;

  List<Widget> _checkboxBuilder () {
    return List.generate(_checkboxList.length, (index) => 
      CheckboxListTile(
        value: _checkboxList[index].value, 
        onChanged:  (value) {
          setState(() {
            _checkboxList[index].value = value!;
          });
        },
        title: Text(_checkboxList[index].title),
        subtitle: Text(_checkboxList[index].subtitle),
        secondary: Icon(_checkboxList[index].icon),
        selected: _checkboxList[index].value,
      )
    );
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _checkboxBuilder(),
          // children: [
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Checkbox(
          //         value: _checkboxItemA, 
          //         activeColor: Colors.green,
          //         onChanged: (value) {
          //           setState(() {
          //             _checkboxItemA = value!;
          //           });
          //         }
          //       )
          //     ],
          //   ),
          //   CheckboxListTile(
          //     value: _checkboxItemA, 
          //     onChanged:  (value) {
          //       setState(() {
          //         _checkboxItemA = value!;
          //       });
          //     },
          //     title: Text('Checkbox Item A'),
          //     subtitle: Text('Description'),
          //     secondary: Icon(Icons.bookmark),
          //     selected: _checkboxItemA,
          //   ),
          // ],
        ),
      ),
    );
  }
}


class CheckboxItemData {
  CheckboxItemData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value
  });

  final String title;
  final String subtitle;
  final IconData icon;
  bool value;
}

final List<CheckboxItemData> _checkboxList = [
  CheckboxItemData(
    title:'1',
    subtitle: '1',
    icon: Icons.bookmark,
    value: false
  ),
  CheckboxItemData(
    title:'2',
    subtitle: '2',
    icon: Icons.bookmark,
    value: false
  ),
  CheckboxItemData(
    title:'3',
    subtitle: '3',
    icon: Icons.bookmark,
    value: false
  ),
];