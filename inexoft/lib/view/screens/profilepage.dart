import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inexoft/view/screens/order_details.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/sizedbox.dart';

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
                    color: const Color.fromARGB(
                        255, 217, 217, 217), // Set the border color here
                    width: 1.0, // Set the border width here
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
                'InexSoft',
                style:
                    GoogleFonts.acme(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              const SizedBox(
                height: 55,
              ),
              ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const OrderDetails();
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
}
