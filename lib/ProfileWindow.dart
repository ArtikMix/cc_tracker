import 'dart:ui';

import 'package:cc_tracker/CClist.dart';
import 'package:cc_tracker/Profile.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';

class ProfileWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileWindowState();
  }
}

class ProfileWindowState extends State<ProfileWindow> {
  Profile profile = new Profile(name: 'User');

  String emailStr = Authentication.mailAdressChecker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CClist()));
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                    ),
                    const Text('Back to Main page')
                  ],
                ),
              ),
              body: ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: (MediaQuery.of(context).size.height / 2),
                        width: (MediaQuery.of(context).size.width),
                        decoration: const BoxDecoration(color: Colors.blue),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              minRadius: 90,
                              child: Icon(
                                Icons.account_box,
                                size: 125,
                              ),
                            ),
                            Text(Authentication.userNameChecker(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30)),
                            Text(
                              emailStr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 16,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  side: BorderSide(
                                      width: 2.0, color: Colors.blue))),
                          onPressed: () async {
                            await Authentication.signInWithGoogle();
                            setState(() {
                              emailStr = Authentication.mailAdressChecker();
                            });
                          },
                          child: Text('Sign in')),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 16,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  side: BorderSide(
                                      width: 2.0, color: Colors.blue))),
                          onPressed: () {
                            Authentication.signOutWithGoogle();
                            setState(() {
                              emailStr = Authentication.mailAdressChecker();
                            });
                          },
                          child: Text('Log out')),
                    ],
                  )
                ],
              ))),
    );
  }
}
