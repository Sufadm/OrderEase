import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inexoft/controller/quantity_provider.dart';
import 'package:inexoft/view/screens/purchase_page.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/sizedbox.dart';
import 'package:inexoft/view/widgets/quantity_input.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  final String productImage;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    final quantityProvider = Provider.of<QuantityProvider>(context);
    final double parsedPrice = double.tryParse(
          productPrice.replaceAll(RegExp(r'[^0-9.]'), ''),
        ) ??
        0.0;
    final totalPrice = quantityProvider.quantity * parsedPrice;
    final discountprice = totalPrice / 10;

    final afterDiscount = totalPrice - discountprice;
    final gstprice = afterDiscount / 5;
    final netTotal = afterDiscount + gstprice;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
                height: 35,
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: kWhite),
                    child: Column(
                      children: [
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            kHeight25,
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350.0,
                              ),
                              child: Text(
                                productName,
                                style: GoogleFonts.acme(fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' ₹${NumberFormat("#,##0.00", "en_US").format(totalPrice)}',
                                  style: GoogleFonts.acme(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                kWidth10,
                                Text(
                                  '10% Off',
                                  style: GoogleFonts.acme(
                                      color: const Color.fromARGB(
                                          255, 126, 126, 126),
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Quantity:   ',
                                  style: GoogleFonts.acme(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                const QuantityInput(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 7, 0, 132))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PurchasePage(
                            nettotal: netTotal.toString(),
                            discounprice: discountprice.toString(),
                            productImage: productImage,
                            productprice:
                                ' ${NumberFormat("#,##0.00", "en_US").format(totalPrice)}',
                            productquantity:
                                quantityProvider.quantity.toString(),
                            productName: productName,
                          );
                        }));
                      },
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: kWhite),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
