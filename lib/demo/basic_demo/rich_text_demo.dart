

import 'package:flutter/material.dart';

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Symbollee",
        style: const TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 32.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100
        ),
        children: [
          TextSpan(
            text: ".net",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16.0
            ),
          )
        ]
      ),
    );
  }
}