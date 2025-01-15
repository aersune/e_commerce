import 'package:hive/hive.dart';

part 'favorites_data.g.dart';

@HiveType(typeId: 0)
class FavoritesData {
  @HiveField(0)
  String name;

  @HiveField(1)
  String price;

  @HiveField(2)
  String brand;

  @HiveField(3)
  String imageUrl;

  @HiveField(4)
  int id;

  @HiveField(5)
  FavoritesData({
    required this.name,
    required this.price,
    required this.brand,
    required this.imageUrl,
    required this.id,
  });
}

@HiveType(typeId: 1)
class CartData {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  String brand;

  @HiveField(3)
  String imageUrl;

  @HiveField(4)
  int id;

  @HiveField(5)
  @HiveField(6)
  int amount;

  CartData({
    required this.name,
    required this.price,
    required this.brand,
    required this.imageUrl,
    required this.id,
    required this.amount,
  });
}
