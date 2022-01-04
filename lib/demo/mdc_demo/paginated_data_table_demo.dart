
import 'package:flutter/material.dart';
import '../../model/post.dart';

class PostDataTableSource extends DataTableSource{
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(_posts[index].title)),
        DataCell(Text(_posts[index].author)),
        // DataCell(Text(_posts[index].description)),
        DataCell(Image.network(_posts[index].imageUrl)),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _posts.length;

  @override 
  int get selectedRowCount => _selectedCount;


  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b)  {
      if(!ascending) {
        final c = a;
        a = b;
        b = c; 
      }
      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}


class PaginatedDataTableDemo extends StatefulWidget {
  const PaginatedDataTableDemo({ Key? key }) : super(key: key);

  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {

  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  void _handleSort (int index, bool ascending) {
    _postDataSource._sort((post) => post.title.length, ascending );

    setState(() {
      _sortColumnIndex = index;
      _sortAscending = ascending;
      // posts.sort((a, b) {
      //   if(!ascending) {
      //     final c = a;
      //     a = b;
      //     b = c;
      //   }
      //   return a.title.length.compareTo(b.title.length);
      // });
    });
  }

  final List<String> _columns = [
    'title', 
    'author', 
    // 'description',
    'imageUrl'
  ];

  final PostDataTableSource _postDataSource = PostDataTableSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaginatedDataTableDemo'),
        elevation: 5.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            PaginatedDataTable(
              header: Text('Posts'),
              rowsPerPage: 5,
              source: _postDataSource,
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
              // rows: posts.map((post) => DataRow(
              //   selected: post.isSelected,
              //   onSelectChanged: (value) {
              //     setState(() {
              //       post.isSelected = value!;
              //     });
              //   },
              //   cells: [
              //     DataCell(Text(post.title)),
              //     DataCell(Text(post.author)),
              //     // DataCell(Text(post.description)),
              //     DataCell(Image.network(post.imageUrl)),
              //   ]
              // )).toList()
            ),
          ],
        )
      ),
    );
  }
}