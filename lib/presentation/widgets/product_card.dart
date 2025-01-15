import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/database/favorites_data.dart';
import 'package:e_commerce/domain/database/hive_box.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    void addProduct(Box box) async {
      var productToCard = FavoritesData(name: "${product.title}",
          price: product.price.toString(),
          brand: "${product.brand}",
          imageUrl: product.images![0],
          id: product.id!.toInt(),
         );

      await box.put(product.id, productToCard);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: product.images![0],
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight)
                    ),
                  );
                },
              ),
              Positioned(
                  right: 10,
                  top: 0,
                  child: ValueListenableBuilder(

                      valueListenable: HiveBox.favoritesData.listenable(), builder: (context, Box<FavoritesData> box, _) {
                    var inBox = box.get(product.id);
                    var isFav = inBox != null;

                    return IconButton(
                      onPressed: () {
                        !isFav ?  addProduct(box) : box.delete(product.id);
                        print("${inBox?.name}");
                      },
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                      ),
                    );
                  })
              ),
            ],
          ),
        ),
        ProductTitle(product: product),
      ],
    );
  }
}
