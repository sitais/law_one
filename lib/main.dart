import 'package:flutter/material.dart';

import 'package:law_one/models/reddit.dart';
import 'package:law_one/models/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reddit Law Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    getReddit().then((posts) {
      setState(() {
        _posts = posts;
      });
    });
  }

  List<Widget> buildListTiles() {
    return _posts
      .map((post) => ListTile(
        leading: CircleAvatar(
          child: Image.network('${!post.thumbnail.contains(".jpg") ? "http://via.placeholder.com/300" : post.thumbnail}', scale: 0.2,
        )),
        title: Text('Title: ${post.title} by ${post.author}'), subtitle: Text(
          'Subreddit: ${post.subreddit} with ${post.ups} upvotes',
        ),
      ))
    .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reddit Top'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getReddit().then((posts) {
            setState(() {
              _posts = posts;
            });
          });
        },
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          firstChild: Center(
            child: CircularProgressIndicator(),
          ),
          secondChild: ListView(
            shrinkWrap: true,
            children: buildListTiles(),
          ),
          crossFadeState: _posts.isNotEmpty
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        ),
      ),
    );
  }
}