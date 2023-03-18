import 'package:cc_tracker/CClist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CCtracker());
}

class CCtracker extends StatelessWidget {
  const CCtracker({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
        title: 'My CCtracker',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CClist());
  }
}
