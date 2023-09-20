import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inexoft/view/screens/purchase_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:inexoft/viewmodel/quantity_provider.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/sizedbox.dart';
import 'package:inexoft/view/widgets/quantity_input.dart';

class ProductDetails extends StatefulWidget {
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
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextEditingController customernameController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double discount = 0.0;
  @override
  Widget build(BuildContext context) {
    final quantityProvider = Provider.of<QuantityProvider>(context);
    final double parsedPrice = double.tryParse(
          widget.productPrice.replaceAll(RegExp(r'[^0-9.]'), ''),
        ) ??
        0.0;
    final totalPrice = quantityProvider.quantity * parsedPrice;
    double netTotalAmount = totalPrice;

    void calculateNetTotal() {
      final discountPercentage =
          double.tryParse(discountPriceController.text) ?? 0.0;
      final discountAmount = (discountPercentage / 100) * totalPrice;
      final netTotal = totalPrice - discountAmount;
      setState(() {
        discount = discountAmount;
        netTotalAmount = netTotal;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 330),
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 40,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kWhite,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 150,
                                width: 190,
                                child: Image.network(
                                  widget.productImage,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350.0,
                              ),
                              child: Text(
                                widget.productName,
                                style: GoogleFonts.acme(fontSize: 15),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'CustomerName:   ',
                              style:
                                  GoogleFonts.acme(fontSize: 15, color: kBlue),
                            ),
                            SizedBox(
                              height: 50,
                              child: TextFormField(
                                controller: customernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'CustomerName cannot be empty';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  // labelText: 'CustomerName',
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                            kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                            kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Price - ₹${NumberFormat("#,##0.00", "en_US").format(totalPrice)}',
                                  style: GoogleFonts.acme(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                kWidth10,
                              ],
                            ),
                            kHeight10,
                            Text(
                              'Discount in %:   ',
                              style:
                                  GoogleFonts.acme(fontSize: 15, color: kBlue),
                            ),
                            SizedBox(
                              height: 75,
                              child: TextFormField(
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                controller: discountPriceController,
                                onChanged: (value) {
                                  calculateNetTotal();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Discount cannot be empty';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  // labelText: 'Discount in %',
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                            kHeight20,
                            Text(
                              'GST: 5%',
                              style: GoogleFonts.acme(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            kHeight20,
                            const Divider(
                              thickness: 1,
                              color: kBlack,
                            ),
                            kHeight10,
                            Text(
                              'Discount - ₹${NumberFormat("#,##0.00", "en_US").format(discount)}',
                              style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            kHeight10,
                            Text(
                              'NetTotal - ₹${NumberFormat("#,##0.00", "en_US").format(netTotalAmount - discount)}',
                              style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 7, 0, 132),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PurchasePage(
                              cstomerName: customernameController.text,
                              discounprice: discount.toString(),
                              nettotal: NumberFormat("#,##0.00", "en_US")
                                  .format(netTotalAmount - discount),
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productprice: widget.productPrice,
                              productquantity:
                                  quantityProvider.quantity.toString(),
                            );
                          }));
                        }
                      },
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: kWhite),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
