import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/const.dart';
import 'package:inexoft/view/utils/sizedbox.dart';
import 'package:inexoft/view/widgets/quantity_input.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? selectedProduct;
  double selectedProductPrice = 0.0; // Initialize with a default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: const TextStyle(color: kWhite),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'customerName cannot be Empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'CustomerName',
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
                ),
                kHeight15,
                SizedBox(
                  height: 60,
                  child: DropdownButtonFormField<String>(
                    value: selectedProduct,
                    onChanged: (newValue) {
                      setState(() {
                        selectedProduct = newValue;

                        0.0; // Use the map to get the price or default to 0.0
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a product';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Products',
                      labelStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    items: productName.map((String product) {
                      return DropdownMenuItem<String>(
                        value: product,
                        child: Container(
                          height: 60,
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Text(product),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '   Quantity:   ',
                      style: GoogleFonts.acme(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const QuantityInput(),
                    kHeight20,
                  ],
                ),
                kHeight10,
                Text(
                  '   Price:-  $selectedProductPrice',
                  style: GoogleFonts.acme(),
                ),
                kHeight20,
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: const TextStyle(color: kWhite),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Discount cannot be Empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Discount',
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
                ),
                kHeight20,
                Text(
                  '  GST: 5%',
                  style: GoogleFonts.acme(fontWeight: FontWeight.w400),
                ),
                kHeight20,
                const Divider(),
                kHeight10,
                Text(
                  '  NetTotal:',
                  style: GoogleFonts.acme(),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
