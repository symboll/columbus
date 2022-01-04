// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '/demo/view_demo/index.dart';
import '/demo/listview_demo.dart';
import '/demo/basic_demo/index.dart';
import '/demo/drawer_demo.dart';
import '/demo/layout_demo/index.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () { print('Navigation is Printed');}, 
          //   icon: const Icon(Icons.menu)
          // ),
          title: Text(
            'Symboll'.toUpperCase(), 
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                print('Search is Printed');
              }, 
              icon:const Icon(Icons.search)
            ),
            IconButton(
              onPressed: () {
                print('more_horiz is Printed');
                Navigator.pop(context);
              }, 
              icon:const Icon(Icons.more_horiz)
            ) 
          ],
          elevation: 5.0, 
          bottom: const TabBar(
            // unselectedLabelColor: Colors.black38,
            // indicatorColor: Colors.black54,
            // indicatorSize: TabBarIndicatorSize.label,
            // indicatorWeight: 1.0,
            tabs: [
              Tab(icon: Icon(Icons.local_florist),),
              Tab(icon: Icon(Icons.change_history),),
              Tab(icon: Icon(Icons.directions_bike),),
              Tab(icon: Icon(Icons.view_quilt),),
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            ViewDemo()
            // Icon(Icons.local_florist, size: 128.0, color: Colors.black26,),
            // Icon(Icons.change_history, size: 128.0, color: Colors.black26,),
            // Icon(Icons.directions_bike, size: 128.0, color: Colors.black26,),
          ]
        ),
        drawer: const DrawerDemo(),
      )
    );
  }
}