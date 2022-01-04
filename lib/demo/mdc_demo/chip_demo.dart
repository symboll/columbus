
import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({ Key? key }) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple', 'Banana', 'Lemon'
  ];
  String _actionChip = 'Noting';
  List<String> _selectedChipList = [];
  String _choiceChip = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChipDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
              // mainAxisAlignment: MainAxisAlignment.center,
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                const Chip(label: Text('Lift Cricle 圣诞节卡jdha ')),
                // SizedBox(width: 16.0,),
                const Chip(label: Text('Lift'), backgroundColor: Colors.orange,),
                // SizedBox(width: 16.0,),
                const Chip(
                  label: Text('likanghua'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      '康', 
                      style: TextStyle( color: Colors.blueGrey ),
                    ),
                  ),
                ),
                // SizedBox(width: 16.0,),
                const Chip(
                  label: Text('likanghua'),
                  avatar: CircleAvatar(
                    backgroundImage:  NetworkImage('https://p9-passport.byteacctimg.com/img/user-avatar/39bcb5f0c7e6c8267d571b315e1293c4~300x300.image'),
                    // child: Text('康'),
                  ),
                ),
                Chip(
                  label: const Text('City'),
                  onDeleted: () {},
                  deleteIcon: const Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: "Remove this chip",
                ),
                const Divider(
                  color: Colors.grey,
                  height: 32.0,
                  // indent: 64.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((item) => Chip(
                    label: Text(item),
                    onDeleted: () {
                      setState(() {
                        _tags.remove(item);
                      });
                    },
                  )).toList(),
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Text('Action Chip is $_actionChip'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: List.generate(_tags.length, (index) => ActionChip(
                    label: Text(_tags[index]), 
                    onPressed: () {
                      setState(() {
                        _actionChip = _tags[index];
                      });
                    }
                  )),
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Text('Chip List is ${_selectedChipList.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  // children: List.generate(_tags.length, (index) => FilterChip(
                  //   label: Text(_tags[index]), 
                  //   selected: _selectedChipList.contains(_tags[index]),
                  //   onSelected: (bool value) {
                  //     // debugPrint('${value.toString()}');
                  //     setState(() {
                  //       if(_selectedChipList.contains(_tags[index])) {
                  //         _selectedChipList.remove(_tags[index]);
                  //       }else {
                  //         _selectedChipList.add(_tags[index]);
                  //       }
                  //     });
                  //   })
                  // ),
                  children: _tags.map((tag) => FilterChip(
                    label: Text(tag), 
                    selected: _selectedChipList.contains(tag),
                    onSelected: (bool value) {
                      setState(() {
                        if(_selectedChipList.contains(tag)) {
                          _selectedChipList.remove(tag);
                        }else {
                          _selectedChipList.add(tag);
                        }
                      });
                    })
                  ).toList()
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Text('Choice Chip is $_choiceChip'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) => ChoiceChip(
                    label: Text(tag), 
                    selected: tag == _choiceChip,
                    onSelected: (value) {
                      setState(() {
                        _choiceChip = tag;
                      });
                    },
                  )).toList(),
                  // children: List.generate(_tags.length, (index) => ChoiceChip(
                  //   label: Text(_tags[index]), 
                  //   selected: _tags[index] == _choiceChip,
                  //   onSelected: (value) {
                  //     setState(() {
                  //       _choiceChip = _tags[index];
                  //     });
                  //   },
                  // )),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restart_alt_rounded),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple', 'Banana', 'Lemon'
            ];
            _actionChip = 'Noting';
            _selectedChipList = [];
          });
          _choiceChip = 'Lemon';
        },
      ),
    );
  }
}
