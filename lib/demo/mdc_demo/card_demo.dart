
import 'package:flutter/material.dart';
import 'package:Columbus/model/post.dart';


class CardDemo extends StatefulWidget {
  const CardDemo({ Key? key }) : super(key: key);

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: posts.map((post) => Card(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16/9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.network(post.imageUrl, fit: BoxFit.cover,),
                  )
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.imageUrl)
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.author),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(post.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: Text('like'.toUpperCase()),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Text('read'.toUpperCase()),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          )).toList()
        )
      ),
    );
  }
}
