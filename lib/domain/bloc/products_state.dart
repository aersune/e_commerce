part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<Product> products;

  ProductsLoadedState({required this.products});
}

final class CategoryProductState extends ProductsState {
  final List<Product> products;

  CategoryProductState({required this.products});
}

final class ProductSearchState extends ProductsState {
  final List<Product> searchResult;

  ProductSearchState({required this.searchResult});

}

final class ProductDetailsState extends ProductsState {
  final Product product;

  ProductDetailsState({required this.product});

}




final class ProductErrorState extends ProductsState {
  final String error;

  ProductErrorState({required this.error});
}

final class ProductCategoryState extends ProductsState {
  final List<CategoryModel> categories;

  ProductCategoryState({required this.categories});
}
