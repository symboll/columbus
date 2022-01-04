
import 'package:flutter/material.dart';
import '/model/post.dart';

class PostDetail extends StatelessWidget {
  const PostDetail(this.post, { Key? key }) : super(key: key);
  final Post post;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: Image.network(post.imageUrl, fit: BoxFit.cover,),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child:  Column(
                children: [
                  Text(post.title, style: Theme.of(context).textTheme.headline5,),
                  Text(post.author, style: Theme.of(context).textTheme.headline6,),
                  const SizedBox(height: 32.0,),
                  // Text('button: ${post.title}', style: Theme.of(context).textTheme.button,),
                  // Text('caption: ${post.title}', style: Theme.of(context).textTheme.caption,),
                  // Text('overline: ${post.title}', style: Theme.of(context).textTheme.overline,),
                  // Text('subtitle1: ${post.title}', style: Theme.of(context).textTheme.subtitle1,),
                  // Text(post.description, style: Theme.of(context).textTheme.bodyText2,),
                  // Text(post.description, style: Theme.of(context).textTheme.bodyText2,),
                  // Text(post.description, style: Theme.of(context).textTheme.bodyText2,),
                  Text(post.description, style: Theme.of(context).textTheme.bodyText2,),
                ],
              ),
            ) 
          ],
        ),
      )
    );
  }
}
