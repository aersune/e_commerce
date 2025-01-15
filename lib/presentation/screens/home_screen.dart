import 'package:e_commerce/common/app_style.dart';
import 'package:e_commerce/domain/bloc/products_bloc.dart';
import 'package:e_commerce/presentation/widgets/products_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/product_model.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(ProductsLoadEvent());

     final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
         Padding(
           padding: const EdgeInsets.only(left: 10.0),
           child: Column(
             children: [
               Text(
                 'Hello Michael',
                 style: AppStyle.h1,
               ),
               Text(
                 'Recommended for you',
                 style: AppStyle.h2,
               ),
             ],
           ),
         ),
          BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
            if (state is ProductsLoadedState) {
              final List<Product> products = state.products;
              return ProductsBuilder(products: products, event: ProductsLoadEvent(),);
            } else if (state is ProductErrorState) {
              return Text(state.error);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          })
        ],
      ),
    );
  }
}
