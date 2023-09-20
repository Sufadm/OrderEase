import 'package:flutter/material.dart';
import 'package:inexoft/viewmodel/quantity_provider.dart';
import 'package:inexoft/view/utils/colors.dart';
import 'package:provider/provider.dart';

class QuantityInput extends StatelessWidget {
  const QuantityInput({super.key});

  @override
  Widget build(BuildContext context) {
    final quantityProvider = Provider.of<QuantityProvider>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 40,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              quantityProvider.decrement();
            },
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            width: 20,
            height: 25,
            child: Center(
              child: Text(
                quantityProvider.quantity.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              quantityProvider.increment();
            },
          ),
        ],
      ),
    );
  }
}
