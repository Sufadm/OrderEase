import 'package:flutter/material.dart';
import 'package:inexoft/view/screens/bottomnav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static Future<void> login(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    final mail = emailController.text;
    final pass = passwordController.text;
    if (mail == 'inexoft'.trim() && pass == '12345'.trim()) {
      final sharedprefs = await SharedPreferences.getInstance();
      sharedprefs.setBool('shared_key_value', true);
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Username and Password are incorrect'),
        backgroundColor: Colors.red,
      ));
    }
  }

  static Future<void> userlogged(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userloggedin = sharedprefs.getBool('shared_key_value');
    if (userloggedin == null || userloggedin == false) {
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));
    }
  }
}
