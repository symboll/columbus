

import 'package:flutter/material.dart';

class DecorationDemo extends StatelessWidget {
  const DecorationDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const NetworkImage('https://resources.ninghao.net/images/the-old-fashioned.png'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400]!.withOpacity(0.5),
            BlendMode.hardLight 
          )
        )
      ),
      // height: double.infinity,
      // width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: const Icon(Icons.pool, size: 32.0, color: Colors.white,),
            // color: const Color.fromRGBO(3, 54, 255, 1.0), 
            // padding: EdgeInsets.only(left: 12.0, right: 24.0, top: 6.0, bottom: 48.0),
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Colors.deepOrange,      // 不能与Container 中color 一起使用
              // border: Border(
              //   top: BorderSide(
              //     color: (Colors.indigoAccent[100])!, 
              //     width: 3.0,
              //     style: BorderStyle.solid
              //   )
              // ),
              border: Border.all(
                color: (Colors.indigoAccent[100])!, 
                width: 3.0,
                style: BorderStyle.solid
              ),
              // borderRadius: const BorderRadius.only(
              //   topLeft: Radius.circular(16.0)
              // )
              // borderRadius: BorderRadius.circular(
              //   16.0
              // ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(12.0, 12.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 10.0,           // 模糊程度
                  spreadRadius: -2.0,        // 阴影扩散程度， 整数 扩大，负数缩小
                )
              ],
              shape: BoxShape.circle,
              // gradient: const RadialGradient(
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(3, 28, 128, 1.0)
              //   ]
              // ),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0)
                ],
                // begin: Alignment.topCenter,
                // end: Alignment.bottomCenter
                begin: Alignment(0, -1),
                end: Alignment(0, 1)
              )
            ),
          )
        ],
      ),
    );
  }
}