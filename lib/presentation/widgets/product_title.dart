import 'package:e_commerce/domain/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../common/app_style.dart';



class ProductTitle extends StatelessWidget {
  final Product product;
  const ProductTitle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "\$${product.price}",
          style: AppStyle.priceStyle,

        ),
        Text(
          "${product.title}",
          style: AppStyle.normal.copyWith(color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        product.brand != null ? Text('Brand: ${product.brand}', style: AppStyle.normal, overflow: TextOverflow.ellipsis,) : SizedBox(),

      ],
    );
  }
}
