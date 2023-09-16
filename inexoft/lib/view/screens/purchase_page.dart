import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:inexoft/model/hive.db.dart';
import 'package:inexoft/view/screens/bottomnav.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
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
                      style: GoogleFonts.acme(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    kHeight5,
                    Text(
                      'Quantity : ${productquantity.toString()}',
                      style: GoogleFonts.acme(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Discount: 10% off',
                      style: GoogleFonts.acme(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'price: $productprice',
                      style: GoogleFonts.acme(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Discount Price: -$discounprice/',
                      style: GoogleFonts.acme(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'GST: 5%',
                      style: GoogleFonts.acme(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const Divider(),
              kHeight5,
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 17),
                  child: Text(
                    'Net Total:   $nettotal /',
                    style: GoogleFonts.acme(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 7, 0, 132)),
                    ),
                    onPressed: () async {
                      final purchaseModel = PurchaseModel(
                        productImage: productImage,
                        productName: productName,
                        productPrice: productprice,
                        productQuantity: productquantity.toString(),
                        discountPrice: discounprice,
                        netTotal: nettotal,
                      );
                      final box =
                          await Hive.openBox<PurchaseModel>('purchase_box');
                      await box.add(purchaseModel);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const BottomNav();
                      }));
                    },
                    child: const Text(
                      'Place Order',
                      style: TextStyle(color: kWhite),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
