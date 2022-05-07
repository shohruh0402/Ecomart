import 'package:ecomarket/provider/saladcount_provider.dart';
import 'package:ecomarket/router/myrouters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SaladProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRouter _forroute = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Maintwo',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: _forroute.onGenerateRoute,
    );
  }
}
