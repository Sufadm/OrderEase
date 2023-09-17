import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inexoft/controller/login_shared_preferences.dart';
import 'package:inexoft/controller/password_visibility_provider.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:provider/provider.dart';

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
    Auth.userlogged(context);
  }

  @override
  Widget build(BuildContext context) {
    final passwordVisibilityProvider =
        Provider.of<PasswordVisibilityProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 98, 19, 144),
              Color.fromARGB(255, 48, 118, 199),
              Color.fromARGB(255, 64, 13, 120),
              Color.fromARGB(255, 73, 53, 153),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              const SizedBox(height: 80.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login',
                        style: GoogleFonts.akshar(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: kWhite)),
                    const SizedBox(height: 10.0),
                    Text('Welcome Inexoft Technologies',
                        style: GoogleFonts.outfit(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: Container(
                  height: 560,
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
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
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
                            return 'Password cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        obscureText: passwordVisibilityProvider.isObscure,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisibilityProvider.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              passwordVisibilityProvider.toggleVisibility();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {
                            Auth.login(context, email, password);
                          },
                          child: Text(
                            'Login',
                            style: GoogleFonts.lato(
                                color: kBlack, fontWeight: FontWeight.bold),
                          ),
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
}
