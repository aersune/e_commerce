import 'package:dio/dio.dart';
import 'package:e_commerce/domain/models/category_model.dart';
import 'package:e_commerce/domain/models/product_model.dart';

class Api {
  static final  String mainUrl = "https://dummyjson.com";
  static final dio = Dio();

  static Future<List<Product>> getProducts(String query) async{

    final response = await dio.get("$mainUrl/products$query");
    if(response.statusCode == 200) {
      Iterable list = response.data['products'];
      return list.map((e) => Product.fromJson(e)).toList();
    }
    else {
      throw Exception('Error ${response.statusCode}');
    }
  }

  static Future<Product> getOneProduct(int id) async{

    final response = await dio.get("$mainUrl/products/$id");
    if(response.statusCode == 200) {

      return Product.fromJson(response.data);
    }
    else {
      throw Exception('Error ${response.statusCode}');
    }
  }





  static Future<List<CategoryModel>> getAllCategories() async{
    final response = await dio.get("$mainUrl/products/categories");
    if(response.statusCode == 200) {
      Iterable list = response.data;
      return list.map((e) => CategoryModel.fromJson(e)).toList();
    }
    else {
      throw Exception('Error ${response.statusCode}');
    }
  }



}