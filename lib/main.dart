import 'package:flutter/material.dart';
import 'package:moneyapp/transactionListScreen.dart';
import 'package:moneyapp/transactionScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor mainAppColor = const MaterialColor(
    0xFFFF4500,
    <int, Color>{
      50: Color.fromRGBO(242, 78, 30, 1),
      100: Color.fromRGBO(242, 78, 30, 1),
      200: Color.fromRGBO(242, 78, 30, 1),
      300: Color.fromRGBO(242, 78, 30, 1),
      400: Color.fromRGBO(242, 78, 30, 1),
      500: Color.fromRGBO(242, 78, 30, 1),
      600: Color.fromRGBO(242, 78, 30, 1),
      700: Color.fromRGBO(242, 78, 30, 1),
      800: Color.fromRGBO(242, 78, 30, 1),
      900: Color.fromRGBO(242, 78, 30, 1),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mainAppColor),
      initialRoute: '/',
      routes: {
        TransactionListScreen.transactionListScreen:(context) => TransactionListScreen(),
        TransactionScreen.transactionScreenPage:(context) => TransactionScreen(),
      },
      // home: TransactionListScreen(),
    );
  }
}
