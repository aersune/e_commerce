import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/app_style.dart';
import 'package:e_commerce/domain/bloc/products_bloc.dart';
import 'package:e_commerce/domain/database/favorites_data.dart';
import 'package:e_commerce/domain/database/hive_box.dart';
import 'package:e_commerce/presentation/screens/details_screen.dart';
import 'package:e_commerce/presentation/widgets/products_row.dart';
import 'package:e_commerce/presentation/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../common/app_colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Favorites',
            style: AppStyle.h2,
          ),
        ),
        ValueListenableBuilder(
            valueListenable: HiveBox.favoritesData.listenable(),
            builder: (context, Box<FavoritesData> box, child) {
              final products = box.values.toList();
              return Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];
                      return InkWell(
                        onTap: () {
                          context.read<ProductsBloc>().add(ProductDetailsEvent(id: product.id));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DetailsScreen(event: ProductsLoadEvent())));
                        },
                        child: Container(
                            width: size.width,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ProductsRow(
                                imageUrl: product.imageUrl,
                                price: product.price,
                                title: product.name,
                                brand: product.brand,
                                myWidget: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          box.deleteAt(index);
                                        },
                                        icon: Icon(Icons.favorite)),
                                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                                  ],
                                ))),
                      );
                    }),
              );
            }),
      ],
    );
  }
}
