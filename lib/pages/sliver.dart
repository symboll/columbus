
import 'package:flutter/material.dart';
import '/model/post.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text('Symboll'),
            // pinned: true,
            // floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Symboll'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w200
                ),
              ),
              background: Image.network(
                'https://resources.ninghao.net/images/say-hello-to-barry.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverGridDemo(),

          // SliverPadding(
          //   padding: EdgeInsets.all(8.0),
          //   sliver: SliverGridDemo(),
          // ),

          // SliverSafeArea(
          //   sliver: SliverPadding(
          //     padding: EdgeInsets.all(8.0),
          //     sliver: SliverGridDemo(),
          //   )
          // ),

          // const SliverSafeArea(
            // sliver: SliverListDemo()
          // )
          const SliverListDemo()
        ],
      ),
    );
  }
}


class SliverListDemo extends StatelessWidget {
  const SliverListDemo({ Key? key }) : super(key: key);

  Widget _sliverChildBuilder (BuildContext context ,int index) {
    return Container(
      height: 150.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(posts[index].imageUrl, ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(6.0, 6.0),
            color: (Colors.grey[600])!,
            blurRadius: 10.0,           // 模糊程度
            spreadRadius: -2.0,        // 阴影扩散程度， 整数 扩大，负数缩小
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(_sliverChildBuilder, childCount:  posts.length)
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({ Key? key }) : super(key: key);
  
  Widget _sliverChildBuilder (BuildContext contetx, int index) {
    return Image.network(
      posts[index].imageUrl,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(_sliverChildBuilder, childCount: posts.length), 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.6
      ),
    );
  }
}