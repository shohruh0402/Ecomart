import 'package:ecomarket/screens/addbuy.dart';
import 'package:ecomarket/screens/compled.dart';
import 'package:ecomarket/screens/firsname.dart';
import 'package:ecomarket/screens/home_creen.dart';
import 'package:ecomarket/screens/home_page.dart';
import 'package:ecomarket/screens/orderpage.dart';
import 'package:ecomarket/screens/search.dart';
import 'package:flutter/material.dart';

class MyRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case '/name':
        return MaterialPageRoute(
          builder: (_) => const FirstName(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) =>  HomeScreen(),
        );
      case '/add':
        return MaterialPageRoute(
          builder: (_) =>  AddBuy(lar: args),
        );
      case '/order':
        return MaterialPageRoute(
          builder: (_) => const OrderPage(),
        );
      case '/comp':
        return MaterialPageRoute(
          builder: (_) => const Compled(),
        );
      case '/ser':
        return MaterialPageRoute(
          builder: (_) => SearchPage(),
        );
    }
  }
}
