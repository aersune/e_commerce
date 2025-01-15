import 'package:e_commerce/common/app_colors.dart';
import 'package:e_commerce/domain/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductsBloc>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        autofocus: false,
        onChanged: (val) {
          val.isEmpty ? productBloc.add(ProductCategoryEvent()) :
          productBloc.add(ProductSearchEvent(query: val));
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightBg,
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
          hintText: 'Search',
          suffixIcon: Icon(Icons.search)
        ),
      ),
    );
  }
}
