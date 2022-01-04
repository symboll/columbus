import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as Http ;
import 'dart:convert';

import 'package:http/retry.dart';


class HttpPage extends StatelessWidget {
  const HttpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpPage'),
      ),
      body: HttpHome(),
    );
  }
}


class HttpHome extends StatefulWidget {
  const HttpHome({ Key? key }) : super(key: key);

  @override
  _HttpHomeState createState() => _HttpHomeState();
}

class _HttpHomeState extends State<HttpHome> {

  @override
  void initState() {
    super.initState();
    // fetchPosts()
    //   .then((value) => print(value));


    // final post = {
    //   'title': "name: ",
    //   'description': 'lisi'
    // };
    // print('post is Map: ${post is Map}');

    // print(post['title']);
    // print(post['description']);

    // final postJson = json.encode(post);
    // print('postJson: $postJson');
    // print('postJson is Map ${postJson is Map}');

    // final postJsonConverted = json.decode(postJson);
    // print(postJsonConverted);
    // print(postJsonConverted['description']);
    // print(postJsonConverted is Map);

  }

  Future<List<Post>> fetchPosts () async {
    final url = Uri.parse('https://resources.ninghao.net/demo/posts.json');
    final response = await Http.get(url);
    if(response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
        .map<Post>((item) => Post.fromJson(item))
        .toList();

      return posts;
    }else {
      throw Exception('Faild to fetch post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snopShot) {
        if(snopShot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text('loading...'),
          );
        }
        return ListView(
          children: snopShot.data.map<Widget>((item){
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      }
    );
  }
}
 

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  );

  Post.fromJson(Map json)
    : id = json['id'],
      title = json['title'],
      description = json['description'],
      author = json['author'],
      imageUrl = json['imageUrl'];

  Map toJson() => {
    'title': title,
    'descritpion': description,
  };
}