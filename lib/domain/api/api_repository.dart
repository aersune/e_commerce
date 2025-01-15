import 'package:e_commerce/domain/models/category_model.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'api.dart';

class ApiRepository {
  Future<List<Product>> getProducts() => Api.getProducts("?limit=0");
  Future<List<Product>> getByCategory(String category) => Api.getProducts("/category/$category");
  Future<List<Product>> getSearchResult(String query) => Api.getProducts("/search?q=$query");
  Future<Product> getProductDetails(int id) => Api.getOneProduct(id);
  Future<List<CategoryModel>> getCategories() => Api.getAllCategories();

}