import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inexoft/view/screens/customernames.dart';
import 'package:inexoft/view/screens/login_screen.dart';
import 'package:inexoft/view/screens/order_details.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/sizedbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 75,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 217, 217, 217),
                    width: 1.0,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiELtUsgMiutWfka9MWnUndduArSK0Qh_sKV--Y8Xs-Sp3YtXqccEqWN6X-U7ANk09DVY&usqp=CAU'),
                  radius: 80,
                ),
              ),
              kHeight10,
              Text(
                'Inexoft',
                style:
                    GoogleFonts.acme(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 55,
              ),
              ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const CustomerName();
                })),
                leading: const Icon(
                  Icons.app_blocking_outlined,
                  color: kBlack,
                ),
                title: Text(
                  'Order Details',
                  style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: kBlack,
                ),
              ),
              ListTile(
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text(
                            'Confirmation',
                            style: GoogleFonts.lato(),
                          ),
                          content: Text(
                            'Do you wish to logout!',
                            style: GoogleFonts.lato(),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.lato(),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  logout(context);
                                },
                                child: Text(
                                  'OK',
                                  style: GoogleFonts.lato(),
                                )),
                          ],
                        )),
                leading: const Icon(
                  Icons.logout_outlined,
                  color: kBlack,
                ),
                title: Text(
                  'Logout',
                  style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  logout(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();
    // ignore: use_build_context_synchronously
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }), (route) => false);
  }
}
