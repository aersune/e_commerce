import 'package:e_commerce/domain/database/favorites_data.dart';
import 'package:hive_flutter/hive_flutter.dart';


abstract class HiveBox {
  static final Box<FavoritesData> favoritesData = Hive.box<FavoritesData>('favorites');
  static final Box<CartData> cartData = Hive.box<CartData>('cartData');
}