import 'package:cc_tracker/CClist.dart';
import 'package:cc_tracker/Profile.dart';
import 'package:flutter/material.dart';

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
                  Container(
                    height: 250,
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
                            onPressed: () {},
                            iconSize: 125,
                          ),
                          //backgroundImage: ,
                        ),
                        //Row()
                        Text(
                          profile.name,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
