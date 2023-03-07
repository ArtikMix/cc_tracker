import 'dart:math';

import 'package:cc_tracker/ProfileWindow.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SideMenuState();
  }
}

class SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
            child: Text(
              style: TextStyle(color: Colors.white, fontSize: 25),
              'Menu',
              textAlign: TextAlign.start,
            ),
            decoration: BoxDecoration(color: Colors.blue)),
        ListTile(
          leading: IconButton(
            iconSize: 50,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileWindow()));
            },
            icon: Icon(
              Icons.account_box,
            ),
            splashRadius: 40,
          ),
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          leading: IconButton(
            iconSize: 50,
            onPressed: () {},
            icon: Icon(
              Icons.settings,
            ),
            splashRadius: 40,
          ),
          title: Text(
            'Settings',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          leading: IconButton(
            iconSize: 50,
            onPressed: () async {
              _aboutMe();
            },
            icon: Icon(
              Icons.question_mark_rounded,
            ),
            splashRadius: 40,
          ),
          title: Text(
            'About me',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    ));
  }

  _aboutMe() async {
    final url = Uri.parse('https://www.linkedin.com/in/artikmix/');

    //var urlLaunching = await canLaunchUrl(url);
    //if (urlLaunching) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
    //} else
    //print('Cant launch URL');
  }
}
