import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';


class RxDartPage extends StatelessWidget {
  const RxDartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartPage'),
        elevation: 5.0,
      ),
      body: RxDartHome(),
    );
  }
}

class RxDartHome extends StatefulWidget {
  const RxDartHome({ Key? key }) : super(key: key);

  @override
  _RxDartHomeState createState() => _RxDartHomeState();
}

class _RxDartHomeState extends State<RxDartHome> {

  late PublishSubject<String> _publishSubject;

  @override
  void initState() {
    super.initState();

    // Stream<String> _stream =
      // Stream.fromIterable(['hello', 'world']);
      // Stream.fromFuture(Future.value('hello ~'));
      // Stream.periodic(Duration(seconds: 3), (x)=> x.toString());

    // _stream.listen(print);


    // PublishSubject<String> _publishSubject = PublishSubject<String>();
    // BehaviorSubject<String> _behaviorSubject = BehaviorSubject<String>();
    // ReplaySubject<String> _replaySubject = ReplaySubject<String>();
    // _publishSubject.listen((value) { print('listen 1: $value');});
    // _publishSubject.add('hello');
    // _publishSubject.listen((value) { print('listen 2: ${value.toUpperCase()}');});
    // _publishSubject.add('world');
    // _publishSubject.close();

    _publishSubject = PublishSubject<String>();
    _publishSubject
      // .map((item) => 'item: $item')
      // .where((item) => item.length > 9)
      .debounce((_) => TimerStream(true, Duration(seconds: 1)))
      .listen((value) {print(value);});

  }

  @override
  void dispose() {
    _publishSubject.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.red
      ), 
      child: TextField(
        decoration: InputDecoration(
          label: Text('Title'),
          filled: true
        ),
        onChanged: (value) {
          _publishSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _publishSubject.add('submit: $value');
        },
      )
    );
  }
}