

import 'package:flutter/material.dart';
import 'package:Columbus/demo/form_demo/form.dart';
import 'pages/i18n_page.dart';
import 'pages/animation_page.dart';
import 'pages/http_page.dart';

import 'pages/mdc.dart';
import 'pages/navigator.dart';
import 'pages/about.dart';
import 'pages/home.dart';
import 'pages/rxdart.dart';
import 'pages/sliver.dart';
import 'pages/page.dart' as single_page;
import 'pages/state_management.dart';
import 'pages/stream_page.dart';
import 'pages/bloc_page.dart';


void main(List<String> args) => runApp(const App());

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:const About(),
      // home: const Home(),
      // home: const SliverPage(), 
      // home: const NavigatorPage(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const NavigatorPage(),
        '/home': (BuildContext context) => const Home(),
        '/about': (BuildContext context) => const About(),
        '/sliver': (BuildContext context) => const SliverPage(),
        // '/state-management': (BuildContext context) => const StateManagementPage(),
        // '/state-management': (BuildContext context) => const StateManagementProvider(),
        '/state-management': (BuildContext context) => const StateManaggemengSm(),
        '/stream': (BuildContext context) => const StreamPage(), 
        '/rxdart': (BuildContext context) => const RxDartPage(), 
        '/bloc': (BuildContext context) => const BlocPage(), 
        '/http': (BuildContext context) => const HttpPage(), 
        '/animation': (BuildContext context) => const AnimationPage(), 
        '/i18n': (BuildContext context) => const I18nPage(), 
        '/form': (BuildContext context) => const FormPage(), 

        '/single': (BuildContext context) => const single_page.Page('Single'),
        '/mdc': (BuildContext context) => const MdcPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // highlightColor: const Color.fromRGBO(255, 255, 255, 0.5),
        // splashColor: Colors.white70
      ),
    );
  }
}

