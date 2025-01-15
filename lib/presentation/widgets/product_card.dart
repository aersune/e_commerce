import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/product_title.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        ProductTitle(product: product),
      ],
    );
  }
}
