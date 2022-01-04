import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationPage'),
      ),
      body: AnimationHome(),
    );
  }
}

class AnimationHome extends StatefulWidget {
  const AnimationHome({ Key? key }) : super(key: key);

  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome>  with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;
  late Animation _animationColor;
  late CurvedAnimation _curved;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      // value: 32.0,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      vsync: this
    );

    _animationController.addListener(() { 
      setState(() {});
    });

    _animationController.addStatusListener((AnimationStatus status) {

    });

    _curved = CurvedAnimation(
      parent: _animationController, 
      curve: Curves.bounceOut 
    );

    _animation = Tween(begin: 32.0, end: 100.0).animate(_curved);
    _animationColor = ColorTween(begin: Colors.red, end: Colors.red[900]).animate(_curved);
    


  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: IconButton(
      //   icon: Icon(Icons.favorite),
      //   iconSize: _animation.value,
      //   color: _animationColor.value ,
      //   onPressed: () {
      //     switch (_animationController.status) {
      //       case AnimationStatus.completed:
      //         _animationController.reverse();
      //         break;
      //       default: _animationController.forward();
      //     }
      //   },
      // ),
      child: AnimationHeart(
        animations: [_animation, _animationColor], 
        controller: _animationController
      ),
    );
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimationHeart({
    required this.animations,
    required this.controller
  }):super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value ,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default: controller.forward();
        }
      },
    );
  }
}
