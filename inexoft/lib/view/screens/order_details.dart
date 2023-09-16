import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:inexoft/model/hive.db.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/sizedbox.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: 45,
              ),
              FutureBuilder(
                future: Hive.openBox<PurchaseModel>(
                    'purchase_box'), // Open the Hive box
                builder: (BuildContext context,
                    AsyncSnapshot<Box<PurchaseModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Loading indicator while opening the box
                  }

                  if (!snapshot.hasData) {
                    return const Text(
                        'No data available.'); // Handle the case where no data is found
                  }

                  final box = snapshot.data!;
                  final purchaseList = box.values.toList(); // Retrieve the data

                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => kHeight10,
                      itemCount: purchaseList.length,
                      itemBuilder: (context, index) {
                        final purchase = purchaseList[index];

                        return Card(
                          color: kWhite,
                          child: Container(
                            constraints: const BoxConstraints(),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(purchase.productImage),
                                ),
                                kWidth10,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        purchase.productName,
                                        style: GoogleFonts.acme(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Quantity: ${purchase.productQuantity}',
                                        style: GoogleFonts.acme(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '₹${purchase.netTotal}',
                                        style: GoogleFonts.acme(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      kHeight20
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
