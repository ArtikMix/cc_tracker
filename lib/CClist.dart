import 'dart:io';

import 'package:cc_tracker/CCdata.dart';
import 'package:cc_tracker/SideMenu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logging/logging.dart';

class CClist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CClistState();
  }

  @override
  initState() {}
}

class CClistState extends State<CClist> {
  List<CCdata> data = [];

  final log = Logger('logger');

  @override
  Widget build(BuildContext context) {
    var _scaffold = Scaffold(
      appBar: AppBar(title: Text('My CCtracker')),
      body: Container(child: ListView(children: _buildList())),
      drawer: SideMenu(),
    );

    var _safeArea = SafeArea(
        child: RefreshIndicator(
      child: _scaffold,
      onRefresh: () => _loadCC(),
    ));

    return _safeArea;
  }

  @override
  void initState() {
    super.initState();
    _loadCC();
  }

  _loadCC() async {
    final response = await http.get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'),
        headers: {'X-CMC_PRO_API_KEY': '7b154255-6072-4622-bac1-8eb2da8be2c9'});

    if (response.statusCode == 200) {
      List jsonMap = (jsonDecode((response.body)))['data'];
      data.clear();

      for (int i = 0; i < jsonMap.length; i++) {
        var allData = jsonMap[i] as Map<String, dynamic>;
        CCdata ccd = CCdata.fromJson(allData);
        data.add(ccd);
      }
    }
    setState(() {
      data;
    });
  }

  List<Widget> _buildList() {
    return data
        .map((CCdata c) => ListTile(
            title: Text(c.name),
            subtitle: Text(c.symbol),
            leading: CircleAvatar(child: Text(c.cmc_rank.toString())),
            trailing: Text('\$${c.price.toStringAsFixed(2)}')))
        .toList();
  }
}
