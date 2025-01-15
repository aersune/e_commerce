import 'package:e_commerce/domain/api/api_repository.dart';
import 'package:e_commerce/domain/bloc/products_bloc.dart';
import 'package:e_commerce/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'domain/database/favorites_data.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoritesDataAdapter());
  Hive.registerAdapter(CartDataAdapter());
  await Hive.openBox<FavoritesData>('favorites');
  await Hive.openBox<CartData>('cartData');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiRepository = ApiRepository();
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ProductsBloc(apiRepository))
    ], child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
    ));
  }
}

