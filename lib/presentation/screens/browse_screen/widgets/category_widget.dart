import 'package:e_commerce/domain/bloc/products_bloc.dart';
import 'package:e_commerce/domain/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_style.dart';

class CategoriesWidget extends StatelessWidget {
  final ValueSetter valueSetter;
  final List<CategoryModel> categories;

  const CategoriesWidget({super.key, required this.categories, required this.valueSetter});

  @override
  Widget build(BuildContext context) {
    Set<String> categoryList = {};
    for (var category in categories) {
      categoryList.add(category.name);
    }
    final productsBloc = context.read<ProductsBloc>();


    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.black.withOpacity(.05),
              ),
            );
          },
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            var category = categoryList.elementAt(index);

            return InkWell(
              onTap: () {
                valueSetter(category);

                productsBloc.add(GetByCategoryEvent(name: category));

              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: AppStyle.h2,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
