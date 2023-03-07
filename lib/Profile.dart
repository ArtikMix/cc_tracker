import 'package:flutter/material.dart';

class Profile {
  String name;
  String? mailAdress;
  Image? profileImage;

  Profile({required this.name});

  String mailAdressChecker() {
    if (mailAdress != null) {
      return mailAdress!;
    } else {
      return 'No mail adress';
    }
  }
}
