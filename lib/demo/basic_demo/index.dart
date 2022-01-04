
import 'package:flutter/material.dart';
import 'decoration_demo.dart';
import 'rich_text_demo.dart';
import 'text_demo.dart';


class BasicDemo extends StatelessWidget {
  const BasicDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const TextDemo();
    // return const RichTextDemo();
    return const DecorationDemo();
  }
}


