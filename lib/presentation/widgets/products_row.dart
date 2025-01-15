import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../common/app_style.dart';


class ProductsRow extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String title;
  final String brand;
  final Widget myWidget;
  const ProductsRow({super.key, required this.imageUrl, required this.price, required this.title, required this.brand, required this.myWidget});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        CachedNetworkImage(
          width: 80,
          height: 100,
          imageUrl: imageUrl,
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
        const Spacer(),
        SizedBox(
          width: size.width * .44,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$$price",
                style: AppStyle.priceStyle,

              ),
              Text(
                title,
                style: AppStyle.normal.copyWith(color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
               Text('Brand: $brand', style: AppStyle.normal, overflow: TextOverflow.ellipsis,) ,

            ],
          ),
        ),
        const Spacer(),
        myWidget

      ],
    );
  }
}
