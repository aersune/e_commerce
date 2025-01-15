import 'package:e_commerce/common/app_style.dart';
import 'package:e_commerce/domain/database/favorites_data.dart';
import 'package:e_commerce/domain/database/hive_box.dart';
import 'package:e_commerce/presentation/widgets/products_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/bloc/products_bloc.dart';
import 'details_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
        valueListenable: HiveBox.cartData.listenable(),
        builder: (context, Box<CartData> box, _) {
          List<CartData> cartData = box.values.toList();
          double totalCost = 0.0;
          for (var cartData in box.values) {
            totalCost += (cartData.price * cartData.amount);
            print(totalCost.toStringAsFixed(2));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Cart',
                  style: AppStyle.h2,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: cartData.length,
                    itemBuilder: (context, index) {
                      var cart = cartData[index];
                      var myBox = box.get(cart.id);
                      return InkWell(
                        onTap: (){
                          context.read<ProductsBloc>().add(ProductDetailsEvent(id: cart.id));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DetailsScreen(event: ProductsLoadEvent())));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: ProductsRow(
                              imageUrl: cart.imageUrl,
                              price: cart.price.toString(),
                              title: cart.name,
                              brand: cart.brand,
                              myWidget: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.more_vert),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                          onTap: () {
                                            setState(() {});
                                            myBox!.amount >= 2 ? myBox.amount -= 1 : null;
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Icon(Icons.remove),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          "${cart.amount}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {});
                                            myBox?.amount += 1;
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff495057), borderRadius: BorderRadius.circular(8)),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ))),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      );
                    }),
              ),
              Container(

                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping',
                          style: AppStyle.normal.copyWith(color: Colors.black87),
                        ),
                        Text(
                          '\$0.00',
                          style: AppStyle.normal.copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: AppStyle.normal.copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '\$${totalCost.toStringAsFixed(2)}',
                          style: AppStyle.normal.copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Ink(
                          width: size.width,
                          height: 52,
                          decoration: BoxDecoration(color: Color(0xff212429), borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Center(
                              child: Text(
                                "Checkout",
                                style: AppStyle.normal.copyWith(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Image.asset('assets/brands.png'),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
