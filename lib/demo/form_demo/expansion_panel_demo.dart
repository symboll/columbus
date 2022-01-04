
import 'package:flutter/material.dart';


class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    required this.headerText,
    required this.body,
    required this.isExpanded,
  });
}


class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({ Key? key }) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {

  List<ExpansionPanelItem> _expansionPanelItem = [];
  List<bool> _isExpanded = [false, false];

  void _expansionCallBack (int index, bool value) {
    setState(() {
      // _isExpanded  = !value;
      // _isExpanded[index] = !value;
      _expansionPanelItem[index].isExpanded = !value;
    });
  }

  @override
  void initState() {
    super.initState();
    _expansionPanelItem = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A', 
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A'),
        ), 
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText: 'Panel B', 
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B'),
        ), 
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText: 'Panel C', 
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C'),
        ), 
        isExpanded: false
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionPanelDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionPanelList(
              expansionCallback: _expansionCallBack,
            //   children: List.generate(_expansionPanelItem.length, (index) => ExpansionPanel(
            //     headerBuilder: (BuildContext context, bool isExpansion) => Container(
            //       padding: EdgeInsets.all(16.0),
            //       child: Text(_expansionPanelItem[index].headerText),
            //     ), 
            //     body: _expansionPanelItem[index].body,
            //     isExpanded: _expansionPanelItem[index].isExpanded
            //   )
            // ),

            children: _expansionPanelItem.map((ExpansionPanelItem item) => ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpansion) => Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(item.headerText),
                ), 
                body: item.body,
                isExpanded: item.isExpanded
              )).toList(),

            

              // children: [
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpansion) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text('Panel A'),
              //       );
              //     }, 
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text('Content for Panel A '),
              //     ),
              //     isExpanded: _isExpanded[0], 
              //   ),
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpansion) {
              //       return Container(
              //         padding: EdgeInsets.all(16.0),
              //         child: Text('Panel B'),
              //       );
              //     }, 
              //     body: Container(
              //       padding: EdgeInsets.all(16.0),
              //       width: double.infinity,
              //       child: Text('Content for Panel B '),
              //     ),
              //     isExpanded: _isExpanded[1], 
              //   )
              // ],
            )
          ],
        ),
      ),
    );
  }
}