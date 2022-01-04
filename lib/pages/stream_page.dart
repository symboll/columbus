
import 'package:flutter/material.dart';
import 'dart:async';

class StreamPage extends StatelessWidget {
  const StreamPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamPage'),
        elevation: 5.0,
      ),
      body: StreamHome(),
    );
  }
}


class StreamHome extends StatefulWidget {
  const StreamHome({ Key? key }) : super(key: key);

  @override
  _StreamHomeState createState() => _StreamHomeState();
}

class _StreamHomeState extends State<StreamHome> {

  late StreamSubscription _streamSubscription;
  late StreamController<String> _streamController;
  late StreamSink _streamSink;
  String _data = '...';

  @override
  void dispose() {
    _streamController.close(); 
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    print('Create a Stream.');
    // Stream<String> _stream = Stream.fromFuture(fetchData());
    _streamController = StreamController <String>();

    _streamSink = _streamController.sink;

    print('Start listening on a stream.');

    // _streamSubscription = 
    //   _stream.listen(onData, onError: onError, onDone: onDone, cancelOnError: false);

    // _streamSubscription = 
    //   _streamController.stream.listen(onData, onError: onError, onDone: onDone, cancelOnError: false);

    print('Initialize completed.');
  }

  void onData (String data) { 
    setState(() {
      _data = data;
    });
    print('data is: $data');
  }

  void onError (error) {
    print('error is: $error');
  }

  void onDone () {
    print('Done !');
  } 

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'hello ~'; 
    // throw Error();
  }

  ///停止订阅
  void _pauseStream () {
    _streamSubscription.pause();
  }

  ///恢复订阅
  void _resumeStream () {
    _streamSubscription.resume();
  }

  /// 取消订阅
  void _cancelStream () {
    _streamSubscription.cancel();
  }

  /// 增加数据
  void _addDataToStream () async {
    print('add data to Stream.');

    String data = await fetchData();
    // _streamController.add(data);
    _streamSink.add(data);
  }
 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(_data),
          StreamBuilder(
            stream: _streamController.stream,
            initialData: '...',
            builder: (BuildContext context, AsyncSnapshot<String> snopshot) => Text(
              '${snopshot.data}', 
              style: TextStyle(color: Theme.of(context).primaryColor),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text('Add'),
                onPressed: _addDataToStream, 
              ),
              TextButton(
                child: Text('Pause'),
                onPressed: _pauseStream, 
              ),
              TextButton(
                child: Text('Resume'),
                onPressed: _resumeStream, 
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: _cancelStream, 
              )
            ],
          ),
        ],
      ),
    );
  }
}
