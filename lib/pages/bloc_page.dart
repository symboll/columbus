import 'dart:async';
import 'package:flutter/material.dart';


class BlocPage extends StatelessWidget {
  const BlocPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocPage'),
          elevation: 5.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterFloatingActionButton(),
      ), 
    );
  }
}

class CounterHome extends StatelessWidget {
  const CounterHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context)!.bloc;
    return Center(
      child: StreamBuilder(
        stream: _counterBloc.count,
        initialData: 0,
        builder: (BuildContext context,AsyncSnapshot snopShot) {
          return ActionChip(
            label: Text('${snopShot.data}'),
            onPressed: () {
              _counterBloc.counter.add(1);
            },
          );
        }
      )
    );
  }
}

class CounterFloatingActionButton  extends StatelessWidget {
  const CounterFloatingActionButton({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context)!.bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({Key? key, required this.child, required this.bloc }) : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final StreamController _streamController = StreamController<int>();
  StreamSink<int> get counter => _streamController.sink as StreamSink<int>;

  final StreamController _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream as Stream<int>;

  CounterBloc() {
    _streamController.stream.listen(onData);
  }

  void disponse () {
    _streamController.close();
    _counterController.close();
  }

  void onData (value) {
    print('value: $value');
    _count += value as int;
    _counterController.add(_count);
  }
  
}
