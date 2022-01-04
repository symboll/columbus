

import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        // StackDemo(),
        // AspectRationDemo(),
        // ConstrainedBoxDemo()
      ]
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 200.0,
        maxWidth: 100.0
      ),
      child: Container(
        color: const Color.fromRGBO(3, 54, 255, 1.0), 
      ),
    );
  }
}

class AspectRationDemo extends StatelessWidget {
  const AspectRationDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 3.0 /2.0,
      child: Container(
        color: const Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            // alignment: Alignment(-1.0, -1.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0)
            ),
            // child: 
          ),
        ),
        // const SizedBox(height: 32.0,),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              // borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0)
                ]
              )
            ),
            child: const Icon(Icons.brightness_2, color: Colors.white, size: 32.0,),
          ),
        ),
        const Positioned(
          right: 20.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0,),
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  const IconBadge(this.icon, { Key? key , this.size = 32.0 }): super(key: key);

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white,),
      height: size + 60,
      width: size + 60,
      color: const Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}