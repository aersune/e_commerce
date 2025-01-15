part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class ProductsLoadEvent extends ProductsEvent {}

final class ProductCategoryEvent extends ProductsEvent {}

final class GetByCategoryEvent extends ProductsEvent {
  final String name;

  GetByCategoryEvent({required this.name});

}

final class ProductSearchEvent extends ProductsEvent {
  final String query;

  ProductSearchEvent({required this.query});

}

final class ProductDetailsEvent extends ProductsEvent {
  final int id;

  ProductDetailsEvent({required this.id});

}