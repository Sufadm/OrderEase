import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:inexoft/model/hive.db.dart';
import 'package:inexoft/view/screens/order_details.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:inexoft/view/utils/sizedbox.dart';
import 'package:lottie/lottie.dart';

class CustomerName extends StatelessWidget {
  const CustomerName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amberAccent),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              FutureBuilder(
                future:
                    getCustomerNames(), // Call the method to retrieve customer names
                builder: (BuildContext context,
                    AsyncSnapshot<List<String>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return Center(
                      child: Lottie.network(
                        'https://lottie.host/77d12cca-195a-4372-9da8-85380b6d8a3f/LFqyLxLC4M.json',
                      ),
                    );
                  }

                  final customerNames = snapshot.data!;

                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => kHeight10,
                      itemCount: customerNames.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OrderDetails(
                              customerName: customerNames[index],
                            );
                          })),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 211, 212, 224),
                            ),
                            width: double.infinity,
                            height: 60,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 150),
                                    child: Text(
                                      customerNames[
                                          index], // Display customer names
                                      style: GoogleFonts.acme(
                                          fontWeight: FontWeight.bold,
                                          color: kBlack),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward_rounded,
                                      color: kBlack,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> getCustomerNames() async {
    final box = await Hive.openBox<PurchaseModel>('purchase_box');
    final purchaseList = box.values.toList();
    final customerNameSet = <String>{};

    for (final purchase in purchaseList) {
      customerNameSet.add(purchase.customerName);
    }

    final customerNames = customerNameSet.toList();
    return customerNames;
  }
}
