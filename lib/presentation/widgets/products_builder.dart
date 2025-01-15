import 'package:e_commerce/common/app_style.dart';
import 'package:e_commerce/domain/bloc/products_bloc.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/details_screen.dart';

class ProductsBuilder extends StatelessWidget {
  final ProductsEvent event;
  final List<Product> products;

  const ProductsBuilder({super.key, required this.products, required this.event});

  @override
  Widget build(BuildContext context) {
    print(products.length);
    if(products.isEmpty) {
      return Center(child: Text('Products Not found', style: AppStyle.h2,));
    }
    return Expanded(
        child: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250, crossAxisSpacing: 20),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.read<ProductsBloc>().add(ProductDetailsEvent(id: products[index].id!.toInt()));
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(event: event,)));

          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridTile(
              child: ProductCard(product: products[index]),
            ),
          ),
        );
      },
    ));
  }
}
