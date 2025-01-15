import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/api/api_repository.dart';
import 'package:e_commerce/domain/models/category_model.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:flutter/cupertino.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiRepository apiRepository;

  ProductsBloc(this.apiRepository) : super(ProductsInitial()) {
    on<ProductsLoadEvent>((event, emit) async {
      try {
        final List<Product> products = await apiRepository.getProducts();
        emit(ProductsLoadedState(products: products));
      } catch (error) {
        emit(ProductErrorState(error: error.toString()));
      }
    });
    on<ProductCategoryEvent>((event, emit) async {
      try {
        final List<CategoryModel> categories = await apiRepository.getCategories();
        emit(ProductCategoryState(categories: categories));
      } catch (error) {
        emit(ProductErrorState(error: error.toString()));
      }
    });
    on<ProductSearchEvent>((event, emit) async {
      try {
        final List<Product> searchResult = await apiRepository.getSearchResult(event.query);
        emit(ProductSearchState(searchResult: searchResult));
      } catch (error) {
        emit(ProductErrorState(error: error.toString()));
      }
    });
    on<ProductDetailsEvent>((event, emit) async {
      try {
        final Product product = await apiRepository.getProductDetails(event.id);
        emit(ProductDetailsState(product: product));
      } catch (error) {
        emit(ProductErrorState(error: error.toString()));
      }
    });

    on<GetByCategoryEvent>((event, emit) async {
      try {
        final List<Product> products = await apiRepository.getByCategory(event.name);
        emit(CategoryProductState(products: products));
      } catch (error) {
        emit(ProductErrorState(error: error.toString()));
      }
    });
  }
}
