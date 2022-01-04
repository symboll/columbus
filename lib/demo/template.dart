
import 'package:flutter/material.dart';

class TemplateDemo extends StatefulWidget {
  const TemplateDemo({ Key? key }) : super(key: key);

  @override
  _TemplateDemoState createState() => _TemplateDemoState();
}

class _TemplateDemoState extends State<TemplateDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TemplateDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [

              ],
            )
          ],
        ),
      ),
    );
  }
}
