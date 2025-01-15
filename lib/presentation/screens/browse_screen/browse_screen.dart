import 'package:e_commerce/presentation/screens/browse_screen/widgets/category_widget.dart';
import 'package:e_commerce/presentation/screens/browse_screen/widgets/category_builder_widget.dart';
import 'package:e_commerce/presentation/screens/browse_screen/widgets/search_bar.dart';
import 'package:e_commerce/presentation/widgets/products_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/products_bloc.dart';
import '../../../domain/models/category_model.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  var selectedCategory = '';
  List<CategoryModel> categories = [];

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SearchBarWidget(),
        BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductCategoryState) {
            categories = state.categories;
            return CategoriesWidget(
              categories: categories,
              valueSetter: (val) {
                setState(() {
                  selectedCategory = val;
                });
              },
            );
          } else if (state is CategoryProductState) {
            return CategoryBuilderWidget(
              categoryList: categories.map((e) => e.name).toList(),
              selectedCategory: selectedCategory,
              products: state.products,
            );
          } else if(state is ProductSearchState) {
            return ProductsBuilder(products: state.searchResult, event: ProductSearchEvent(query: ''),);
          }


          else if (state is ProductErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        })
      ],
    );
  }
}
