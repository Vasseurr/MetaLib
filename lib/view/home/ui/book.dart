import 'package:flutter/material.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("BOOK"),
    );
  }
}
