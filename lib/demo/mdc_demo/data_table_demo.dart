
import 'package:flutter/material.dart';
import '../../model/post.dart';


class DataTableDemo extends StatefulWidget {
  const DataTableDemo({ Key? key }) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {

  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  void _handleSort (int index, bool ascending) {
    setState(() {
      _sortColumnIndex = index;
      _sortAscending = ascending;
      posts.sort((a, b) {
        if(!ascending) {
          final c = a;
          a = b;
          b = c;
        }
        return a.title.length.compareTo(b.title.length);
      });
    });
  }

  final List<String> _columns = [
    'title', 
    'author', 
    // 'description',
    'imageUrl'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataTableDemo'),
        elevation: 5.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              // onSelectAll: (value) {
              //   print('value: ${value.toString()}');
              // },
              columns: _columns.map((column) => DataColumn(
                  label: Container(
                    child: Text(column),
                    width: 80.0,
                  ),
                  onSort: _handleSort
                )
              ).toList(), 
              rows: posts.map((post) => DataRow(
                selected: post.isSelected,
                onSelectChanged: (value) {
                  setState(() {
                    post.isSelected = value!;
                  });
                },
                cells: [
                  DataCell(Text(post.title)),
                  DataCell(Text(post.author)),
                  // DataCell(Text(post.description)),
                  DataCell(Image.network(post.imageUrl)),
                ]
              )).toList()
            ),
          ],
        )
      ),
    );
  }
}