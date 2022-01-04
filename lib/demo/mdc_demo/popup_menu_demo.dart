
import 'package:flutter/material.dart';

class PopupMenuDemo extends StatefulWidget {
  const PopupMenuDemo({ Key? key }) : super(key: key);

  @override
  _PopupMenuDemoState createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {

  String _popupValue = '';
  List<PopupMenuEntry<String>> _itemBuilder (BuildContext context) {
    return const [
      PopupMenuItem(
        value: 'Home',
        child: Text('Home')
      ),
      PopupMenuItem(
        value: 'Class',
        child: Text('Class')
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopupMenuDemo '),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_popupValue),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton(
                  onSelected: (String value) {
                    setState(() {
                      _popupValue = value;
                    });
                  },
                  itemBuilder: _itemBuilder
                )
              ],
            )
          ],
        ),
      )
    );
  }
}