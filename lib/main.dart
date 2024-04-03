import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          title: 'shop',
          theme: ThemeData(
            fontFamily: 'IstokWeb',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'IstokWeb',
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromRGBO(119, 119, 119, 1),
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            useMaterial3: true,
          ),
          home: const HomePage()
          //     ProductDetails(
          //   product: products[0],
          // ),
          ),
    );
  }
}
