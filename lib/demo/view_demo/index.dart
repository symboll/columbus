
import 'package:flutter/material.dart';
import '../../model/post.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return const GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({ Key? key }) : super(key: key);

  Widget _itemBuilder (BuildContext contetxt, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0
      ), 
      itemBuilder: _itemBuilder,
      itemCount: posts.length,
    ); 
  }
}

class GridViewExtentDemo extends StatelessWidget {
  const GridViewExtentDemo({ Key? key }) : super(key: key);
  List <Widget> _buildTips () {
    return List.generate(posts.length, (index) => Container(
      color: Colors.grey[300],
      alignment: Alignment(0.0, 0.0),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(posts[index].title, style: const TextStyle(fontWeight: FontWeight.bold),),
                Text(posts[index].author)
              ],
            )
          )
        ],
      ),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 300.0,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: _buildTips(),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({ Key? key }) : super(key: key);

  List <Widget> _buildTips () {
    return List.generate(posts.length, (index) => Container(
      color: Colors.grey[300],
      alignment: Alignment(0.0, 0.0),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(posts[index].title, style: const TextStyle(fontWeight: FontWeight.bold),),
                Text(posts[index].author)
              ],
            )
          )
        ],
      ),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      // scrollDirection: Axis.horizontal,
      children: _buildTips(),
      // children: [
      //   Container(
      //     color: Colors.grey[300],
      //     alignment: Alignment(0.0, 0.0),
      //     child: Text(
      //       'Item',
      //       style: TextStyle(
      //         fontSize: 18.0,
      //         color: Colors.grey
      //       )
      //     ),
      //   )
      // ],
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  const PageViewBuilderDemo({ Key? key }) : super(key: key);

    Widget _itemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(posts[index].title, style: const TextStyle(fontWeight: FontWeight.bold),),
              Text(posts[index].author)
            ],
          )
        )
      ],
    );
  } 

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _itemBuilder
    );
  }
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false,
      // reverse: true,
      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) {
        debugPrint('currentpage: $currentPage');
      },
      controller: PageController(
        initialPage: 2,
        // keepPage: false
        // viewportFraction: 0.8
      ),
      children: [
        Container(
          color: Colors.brown[900],
          alignment: const Alignment(0.0, 0.0),
          child: const Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: const Alignment(0.0, 0.0),
          child: const Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: const Alignment(0.0, 0.0),
          child: const Text(
            'THREE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        )
      ]
    );
  }
}