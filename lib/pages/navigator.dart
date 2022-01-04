

import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }, 
              child:const Text('Home')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/about');
              }, 
              child:const Text('About')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/sliver');
              }, 
              child:const Text('Sliver')
            ),
            TextButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (BuildContext context) => const Page("Next"))
                // );
                Navigator.pushNamed(context, '/single');
              }, 
              child:const Text('Single')
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              }, 
              child:const Text('Form')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/mdc');
              }, 
              child:const Text('MDC')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/state-management');
              }, 
              child:const Text('StateManagement')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/stream');
              }, 
              child:const Text('Stream')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/rxdart');
              }, 
              child:const Text('RxDart')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/bloc');
              }, 
              child:const Text('bloc')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/http');
              }, 
              child:const Text('Http')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/animation');
              }, 
              child:const Text('Animation')
            ),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/i18n');
              }, 
              child:const Text('I18n')
            ),
          ],
        ),
      ),
    );
  }
}


