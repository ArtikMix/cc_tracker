import 'package:cc_tracker/CClist.dart';
import 'package:cc_tracker/ProfileWindow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static String? email;
  static String? username;
  static Image? avatar;

  static String mailAdressChecker() {
    if (email != null) {
      return email!;
    } else {
      return 'No mail adress';
    }
  }

   static String userNameChecker() {
    if (username != null) {
      return username!;
    } else {
      return 'User';
    }
  }

  static Image avatarChecker(){
    if(avatar!=null){
      return avatar!;
    }else{
      return AssetImage('assets/test_pic.png') as Image;
    }
  }

  static signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    email = googleUser.email;
    username = googleUser.displayName;
    avatar = Image.network(googleUser.photoUrl!);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static signOutWithGoogle() async {
    await FirebaseAuth.instance.signOut();
    email = null;
    username = "User";
    avatar = null;
  }

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return CClist();
          } else {
            return ProfileWindow();
          }
        });
  }
}
