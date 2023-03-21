import 'package:cc_tracker/CClist.dart';
import 'package:cc_tracker/ProfileWindow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static String? _email;
  static String? _username;
  static Image? _avatar;

  static String mailAdressChecker() => _email ?? 'No mail adress';

   static String userNameChecker() {
    if (_username != null) {
      return _username!;
    } else {
      return 'User';
    }
  }

  static Image avatarChecker(){
    if(_avatar!=null){
      return _avatar!;
    }else{
      return Image.asset('assets/test_pic.png');
    }
  }

  static signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    fillParameters(googleUser.email, googleUser.displayName, Image.network(googleUser.photoUrl!));

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static signOutWithGoogle() async {
    await FirebaseAuth.instance.signOut();
    
    fillParameters(null, 'User', null);
  }

  static void fillParameters(String? email, String? username, Image? avatar) {
    _email = email;
    _username = username;
    _avatar = avatar;
  }

  @override
  void initState() async{
    
  }

  // handleAuthState() {
  //   return StreamBuilder(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: (BuildContext context, snapshot) {
  //         if (snapshot.hasData) {
  //           return CClist();
  //         } else {
  //           return ProfileWindow();
  //         }
  //       });
  // }
}
