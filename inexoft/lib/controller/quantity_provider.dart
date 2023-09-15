import 'package:flutter/material.dart';

// class QuantityProvider extends ChangeNotifier {
//   int _quantity = 1;

//   int get quantity => _quantity;

//   void increment() {
//     if (_quantity < 10) {
//       _quantity++;
//       notifyListeners();
//     }
//   }

//   void decrement() {
//     if (_quantity > 1) {
//       _quantity--;
//       notifyListeners();
//     }
//   }
// }

class QuantityProvider extends ChangeNotifier {
  int quantity = 1;

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }
}
