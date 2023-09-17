import 'package:flutter/material.dart';
import 'package:inexoft/view/screens/bottomnav.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  bool isdatamatched = false;
  final email = TextEditingController();

  final password = TextEditingController();
  @override
  void initState() {
    super.initState();
    userlogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 138, 146, 156),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40.0),
                      TextFormField(
                        style: const TextStyle(color: kWhite),
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username cannot be Empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        style: const TextStyle(color: kWhite),
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'password cannot be Empty';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            checking(context);
                          },
                          child: const Text('Login'),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Center(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checking(BuildContext context) async {
    final mail = email.text;
    final pass = password.text;
    if (mail == 'sufad' && pass == '12345') {
      final sharedprefs = await SharedPreferences.getInstance();
      sharedprefs.setBool('shared_key_value', true);
      setState(() {
        isdatamatched = true;
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const BottomNav();
        }));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Username and Password are incorrect'),
        backgroundColor: Colors.red,
      ));
      setState(() {
        isdatamatched = false;
      });
    }
  }

  Future<void> userlogged() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userloggedin = sharedprefs.getBool('shared_key_value');
    if (userloggedin == null || userloggedin == false) {
      const LoginPage();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));
    }
  }
}
