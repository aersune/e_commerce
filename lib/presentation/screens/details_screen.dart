import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/bloc/products_bloc.dart';
import 'package:e_commerce/domain/database/hive_box.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../common/app_colors.dart';
import '../../common/app_style.dart';
import '../../domain/database/favorites_data.dart';

class DetailsScreen extends StatelessWidget {
  final ProductsEvent event;

  const DetailsScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    String capitalize(String str) {
      if (str.isEmpty) return str;
      return str[0].toUpperCase() + str.substring(1).toLowerCase();
    }

    return WillPopScope(
      onWillPop: () async {
        context.read<ProductsBloc>().add(event);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(capitalize("category")),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductDetailsState) {
            Product product = state.product;
            void addProduct(Box box) async {
              var saveProduct = FavoritesData(
                  name: "${product.title}",
                  price: "${product.price}",
                  brand: "${product.brand}",
                  imageUrl: product.images![0],
                  id: product.id!.toInt());

              await box.put(product.id, saveProduct);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(product.images![0]), fit: BoxFit.fitHeight)),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: HiveBox.favoritesData.listenable(),
                              builder: (context, Box<FavoritesData> box, widget) {
                                var boxData = box.get(product.id);
                                var hasData = boxData != null;
                                return IconButton(
                                    onPressed: () {
                                      !hasData ? addProduct(box) : box.delete(product.id);
                                    },
                                    icon: Icon(!hasData ? Icons.favorite_border : Icons.favorite));
                              }),
                          InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                HiveBox.cartData.put(
                                    product.id,
                                    CartData(
                                        name: "${product.title}",
                                        price: product.price,
                                        brand: "${product.brand}",
                                        imageUrl: product.images![0],
                                        id: product.id!.toInt(),
                                        amount: 1));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ImageIcon(AssetImage('assets/icons/cart.png')),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: AppStyle.priceStyle.copyWith(fontSize: 25),
                      ),
                      Text(
                        "${product.title}",
                        style: AppStyle.normal
                            .copyWith(color: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      product.brand != null
                          ? Text(
                              'Brand: ${product.brand}',
                              style: AppStyle.normal.copyWith(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            )
                          : SizedBox(),
                      Text(
                        "${product.description}",
                        style: AppStyle.normal,
                      )
                    ],
                  ),
                )
              ],
            );
          } else if (state is ProductErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
