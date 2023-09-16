import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inexoft/view/screens/product_details.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150.0), // Rounded top-left corner
              ),
              color: Color.fromARGB(255, 24, 1, 128),
            ),
            height: 170,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: productImages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductDetails(
                        productImage: productImages[index],
                        productName: productName[index],
                        productPrice: productPrice[index],
                      );
                    })),
                    child: Card(
                      color: kWhite,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(productImages[index]),
                        ),
                        title: Text(
                          productName[index],
                          style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productPrice[index],
                              style: GoogleFonts.lato(),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
