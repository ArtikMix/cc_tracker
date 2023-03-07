import 'package:cc_tracker/CClist.dart';
import 'package:flutter/material.dart';

void main() => runApp(CCtracker());

class CCtracker extends StatelessWidget {
  const CCtracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My CCtracker',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CClist());
  }
}
