import 'package:delivery_app/screens/about_us_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/order_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderProvider(),
      child: MaterialApp(
        title: 'Restaurant Delivery App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/menu': (context) => const MenuScreen(),
          '/cart': (context) => const CartScreen(),
          '/about_us': (context) => const AboutUsScreen(),
        },
      ),
    );
  }
}
