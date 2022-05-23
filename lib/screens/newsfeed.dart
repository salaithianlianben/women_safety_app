import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text("Newsfeed Page")));
  }
}
