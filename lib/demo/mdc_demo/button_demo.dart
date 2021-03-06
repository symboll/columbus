import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  ButtonDemo({Key? key}) : super(key: key);

  final Widget buttonBarDemo = Row(
    children: [
      ButtonBar(
        children: [
          OutlinedButton(
            child: const Text('Button Bar'),
            onPressed: () {}
          ),
          OutlinedButton(
            child: const Text('Button Bar'),
            onPressed: () {}
          ),
        ],
      )
    ],
  );

  final Widget buttonExpanded = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        flex: 1,
        child: OutlinedButton(
          child: const Text('Button'),
          onPressed: () {}
        ),
      ),
      const SizedBox(width: 16.0,),
      Expanded(
        flex: 2,
        child: OutlinedButton(
          child: const Text('Button'),
          onPressed: () {}
        ),
      )
    ],
  );

  final Widget fixedWidthButton = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 130.0,
        child: OutlinedButton(
          child: const Text('Button'),
          onPressed: () {}
        ),
      )
    ],
  );

  final Widget outlinedButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      OutlinedButton(
        child: const Text('Button'),
        onPressed: () {}
      ),
      const SizedBox(width: 16.0,),
      OutlinedButton.icon(
        icon: const Icon(Icons.add), 
        label: const Text('Button'),
        onPressed: () {},
      )
    ],
  );

  final Widget raisedButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        child: const Text('Button'),
        onPressed: () {}
      ),
      const SizedBox(width: 16.0,),
      ElevatedButton.icon(
        icon: const Icon(Icons.add),  
        label: const Text('Button'),
        onPressed: () {}
      ),
    ],
  );

  final Widget textButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        child: const Text('Button'),
        onPressed: () {},
        style: const ButtonStyle(
          // textStyle: MaterialStateProperty.all(
          //   TextStyle(
          //     fontSize: 18.0,
          //     backgroundColor: Colors.green
          //   )
          // ),
          // foregroundColor: MaterialStateProperty.resolveWith(
          //   (states) {
          //     if (states.contains(MaterialState.focused) &&
          //         !states.contains(MaterialState.pressed)) {
          //       //????????????????????????
          //       return Colors.blue;
          //     } else if (states.contains(MaterialState.pressed)) {
          //       //??????????????????
          //       return Colors.deepPurple;
          //     }
          //     //????????????????????????
          //     return Colors.grey;
          //   },
          // ),
          // //????????????
          // backgroundColor:MaterialStateProperty.resolveWith((states) {
          //   //??????????????????????????????
          //   if (states.contains(MaterialState.pressed)) {
          //     return Colors.blue[200];
          //   }
          //   //???????????????????????????
          //   return null;
          // }),
          // //?????????????????????
          // overlayColor: MaterialStateProperty.all(Colors.yellow),
          // //????????????  ?????????????????????TextButton
          // elevation: MaterialStateProperty.all(0),
          // //?????????????????????
          // padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          // //?????????????????????
          // minimumSize: MaterialStateProperty.all(Size(200, 100)),
          // //????????????
          // side:  MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
          // //??????????????? ????????? side ???????????????
          // shape: MaterialStateProperty.all(StadiumBorder()),
        ),
      ),
      const SizedBox(width: 16.0,),
      TextButton.icon(
        onPressed: () {}, 
        icon: const Icon(Icons.add), 
        label: const Text('Button')
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textButtonDemo,
            raisedButtonDemo,
            outlinedButtonDemo,
            fixedWidthButton,
            buttonExpanded,
            buttonBarDemo
          ],
        ),
      )
    );
  }
}
