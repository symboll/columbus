
import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  FloatingActionButtonDemo({ Key? key }) : super(key: key);

  final Widget _floatingActionButton = FloatingActionButton(
    child: const Icon(Icons.arrow_back),
    // backgroundColor: Colors.green,
    // shape: BeveledRectangleBorder(
    //   borderRadius: BorderRadius.circular(3.0)
    // ),
    onPressed: () {
      // Navigator.of(context).pop();
    },
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {
      // Navigator.of(context).pop();
    }, 
    icon: const Icon(Icons.add),
    label: const Text('add')
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('FloatingActionButton'),
        elevation: 0.0,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {}, 
      //   icon: const Icon(Icons.add),
      //   label: const Text('add')
      // ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}