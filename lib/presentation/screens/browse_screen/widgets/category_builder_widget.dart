import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/products_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bloc/products_bloc.dart';

class CategoryBuilderWidget extends StatefulWidget {
  final List<String> categoryList;
  final String selectedCategory;
  final List<Product> products;

  const CategoryBuilderWidget(
      {super.key, required this.categoryList, required this.selectedCategory, required this.products});

  @override
  State<CategoryBuilderWidget> createState() => _CategoryBuilderWidgetState();
}

class _CategoryBuilderWidgetState extends State<CategoryBuilderWidget> {

  String selected = '';
  @override
  void initState() {
    selected = widget.selectedCategory;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final productsBloc = context.read<ProductsBloc>();

    return SizedBox(
      height: MediaQuery.of(context).size.height * .73,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.sort_down),
                  onPressed: () {
                    productsBloc.add(ProductCategoryEvent());
                  },
                ),
                PopupMenuButton<String>(
                  borderRadius: BorderRadius.circular(8),
                  // icon: Icon(Icons.keyboard_arrow_down),
                  onSelected: (value) {
                    print('Selected $value');
                    setState(() {
                      selected = value;
                    });
                    productsBloc.add(GetByCategoryEvent(name: value));
                  },

                  itemBuilder: (BuildContext context) {
                    return widget.categoryList.map((String category) {
                      return PopupMenuItem<String>(value: category, child: Text(category));
                    }).toList();
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(selected),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [Text('Brand'), Icon(Icons.keyboard_arrow_down)],
                ),
                Row(
                  children: [Text('Price'), Icon(Icons.keyboard_arrow_down)],
                ),
              ],
            ),
          ),
          ProductsBuilder(products: widget.products, event: GetByCategoryEvent(name: selected),)
        ],
      ),
    );
  }
}
