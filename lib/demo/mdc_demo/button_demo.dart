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
          //       //获取焦点时的颜色
          //       return Colors.blue;
          //     } else if (states.contains(MaterialState.pressed)) {
          //       //按下时的颜色
          //       return Colors.deepPurple;
          //     }
          //     //默认状态使用灰色
          //     return Colors.grey;
          //   },
          // ),
          // //背景颜色
          // backgroundColor:MaterialStateProperty.resolveWith((states) {
          //   //设置按下时的背景颜色
          //   if (states.contains(MaterialState.pressed)) {
          //     return Colors.blue[200];
          //   }
          //   //默认不使用背景颜色
          //   return null;
          // }),
          // //设置水波纹颜色
          // overlayColor: MaterialStateProperty.all(Colors.yellow),
          // //设置阴影  不适用于这里的TextButton
          // elevation: MaterialStateProperty.all(0),
          // //设置按钮内边距
          // padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          // //设置按钮的大小
          // minimumSize: MaterialStateProperty.all(Size(200, 100)),
          // //设置边框
          // side:  MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
          // //外边框装饰 会覆盖 side 配置的样式
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
