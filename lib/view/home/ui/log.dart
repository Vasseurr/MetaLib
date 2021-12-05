import 'package:flutter/material.dart';
import 'package:getx_starter/core/components/widgets/custom_scaffold_with_animated_fab.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("LOG"),
    );
  }
}
