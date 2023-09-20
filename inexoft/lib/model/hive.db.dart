import 'package:hive/hive.dart';
part 'hive.db.g.dart';

@HiveType(typeId: 0)
class PurchaseModel extends HiveObject {
  @HiveField(0)
  final String productImage;

  @HiveField(1)
  final String productName;

  @HiveField(2)
  final String productPrice;

  @HiveField(3)
  final String productQuantity;

  @HiveField(4)
  final String discountPrice;

  @HiveField(5)
  final String netTotal;

  @HiveField(6)
  final String customerName;

  PurchaseModel({
    required this.customerName,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.discountPrice,
    required this.netTotal,
  });
}
