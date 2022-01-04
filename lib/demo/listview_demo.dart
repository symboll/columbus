
import 'package:flutter/material.dart';
import '/pages/post_detail.dart';
import '/model/post.dart';



class ListViewDemo extends StatelessWidget {
  const ListViewDemo({ Key? key }) : super(key: key);

    Widget _itemBuilder (BuildContext context,int index) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 16.0/9.0,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover,),
              ),
              const SizedBox(height: 16.0),
              Text(
                posts[index].title, 
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                posts[index].author, 
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 16.0,)
            ], 
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  // debugPrint('debug');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PostDetail(posts[index])
                    )
                  );
                },
              ),
            )
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: posts.length,
    );
  }
}