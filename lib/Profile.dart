import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile {
  String name;
  String? mailAdress;
  Image? profileImage;

  Profile({required this.name});
}
