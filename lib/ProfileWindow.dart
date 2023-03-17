//import 'dart:html';
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 300,
                        width: (MediaQuery.of(context).size.width),
                        decoration: const BoxDecoration(color: Colors.blue),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              minRadius: 90,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.account_box,
                                ),
                                onPressed: () {
                                  Authentication.signInWithGoogle();
                                },
                                iconSize: 125,
                              ),
                              //backgroundImage: ,
                            ),
                            Text(profile.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30)),
                            Text(
                              profile.mailAdressChecker(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 500,
                        width: (MediaQuery.of(context).size.width),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 173, 213, 233)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.blue,
                                    backgroundColor: Colors.white,
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        side: BorderSide(
                                            width: 2.0, color: Colors.white))),
                                onPressed: () {
                                },
                                child: Text('Sign in')),
                            TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.blue,
                                    backgroundColor: Colors.white,
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        side: BorderSide(
                                            width: 2.0, color: Colors.white))),
                                onPressed: () {
                                  Authentication.signOutWithGoogle();
                                },
                                child: Text('Log out')),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
