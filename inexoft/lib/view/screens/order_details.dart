import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:inexoft/model/hive.db.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/sizedbox.dart';

class OrderDetails extends StatelessWidget {
  final String customerName;

  const OrderDetails({
    Key? key,
    required this.customerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredOrders = getFilteredOrders(customerName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Orders for $customerName',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => kHeight10,
        itemCount: filteredOrders.length,
        itemBuilder: (context, index) {
          final purchase = filteredOrders[index];
          return Card(
            color: kWhite,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            purchase.productName,
                            style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Quantity: ${purchase.productQuantity}',
                            style:
                                GoogleFonts.acme(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₹${purchase.netTotal}',
                            style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          kHeight20
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<PurchaseModel> getFilteredOrders(String customerName) {
    final box = Hive.box<PurchaseModel>('purchase_box');
    final allOrders = box.values.toList();
    return allOrders
        .where((order) => order.customerName == customerName)
        .toList();
  }
}
