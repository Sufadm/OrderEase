import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/sizedbox.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage(
      {super.key,
      required this.productImage,
      required this.productprice,
      required this.productquantity,
      required this.productName,
      required this.discounprice,
      required this.nettotal});
  final String productImage;
  final String productName;
  final String productprice;
  final String productquantity;
  final String discounprice;
  final String nettotal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 290,
                    width: 190,
                    child: Image.network(
                      productImage,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
            kHeight20,
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Quantity : ${productquantity.toString()}',
                    style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Discount: 10% off',
                    style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'price: $productprice',
                    style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Discount Price: -$discounprice/',
                    style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'GST: 5%',
                    style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(),
            kHeight5,
            Container(
              margin: const EdgeInsets.only(left: 17),
              child: Text(
                'Net Total:   $nettotal /',
                style:
                    GoogleFonts.acme(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
