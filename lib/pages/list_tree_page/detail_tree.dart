import 'package:demo/models/Tree.dart';
import 'package:flutter/material.dart';

class DetailTree extends StatelessWidget {
  final Tree tree;
  DetailTree({Key key, @required this.tree}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tree.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(tree.name),
      ),
    );
  }
}
