
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementPage extends StatefulWidget {
  const StateManagementPage({ Key? key }) : super(key: key);

  @override
  _StateManagementPageState createState() => _StateManagementPageState();
}

class _StateManagementPageState extends State<StateManagementPage> {
  int _count = 0;
  void _increase () {
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementPage'),
        elevation: 5.0,
      ),
      // body: Center(
      //   child: Chip(
      //     label: Text('$_count'),
      //   ),
      // ),
      body: Counter(_count, _increase),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _increase,
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;
  const Counter(this.count, this.increaseCount, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}



/// Provider
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  const CounterProvider({
    required this.count,
    required this.increaseCount,
    required this.child,
    Key? key,
  }): super( key: key, child: child);

  static CounterProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class StateManagementProvider extends StatefulWidget {
  const StateManagementProvider({ Key? key }) : super(key: key);

  @override
  _StateManagementProviderState createState() => _StateManagementProviderState();
}

class _StateManagementProviderState extends State<StateManagementProvider> {
  int _count = 0;
  void _increaseCount () {
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementPage'),
          elevation: 5.0,
        ),
        body: CounterWrap(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      )
    );
  }
}

class CounterWrap extends StatelessWidget {
  const CounterWrap({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Count(),
    );
  }
}

class Count extends StatelessWidget {
  const Count({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context)!.count;
    final VoidCallback increaseCount = CounterProvider.of(context)!.increaseCount;
    
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}



/// Scoped Model
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount () {
    _count++;
    notifyListeners();
  }
}

class StateManaggemengSm extends StatelessWidget {
  const StateManaggemengSm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementPage'),
          elevation: 5.0,
        ),
        body: CounterWrapSm(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (BuildContext context, Widget? child, CounterModel model) => FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: model.increaseCount
          ),
        ),
      )
    );
  }
}

class CounterWrapSm extends StatelessWidget {
  const CounterWrapSm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CountSm(),
    );
  }
}

class CountSm extends StatelessWidget {
  const CountSm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return ScopedModelDescendant<CounterModel>(
      builder:(context, child, model) =>  ActionChip(
        label: Text('scopedModel: ${model.count}'), 
        onPressed: model.increaseCount
      ),
    );
  }
}
