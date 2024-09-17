import 'package:flutter/material.dart';
import 'package:social_flutter/home.dart';
import 'package:social_flutter/market1.dart';
import 'package:social_flutter/market2.dart';
import 'package:social_flutter/market3.dart';
import 'package:social_flutter/market4.dart';
import 'package:social_flutter/market5.dart';
import 'package:social_flutter/market6.dart';
import 'package:social_flutter/market7.dart';
import 'package:social_flutter/market8.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Socail Media App',
      theme: ThemeData(
        colorSchemeSeed: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: "Home",
      routes: {
        "Home": (context) => const UniConnectApp(),
        "Market1": (context) => const Market1(),
        "Market2": (context) => const Market2(
              title: "Market2",
            ),
        "Market3": (context) => const Market3(
              title: "Market3",
            ),
        "Market4": (context) => const Market4(),
        "Market5": (context) => const Market5(
              title: "Market5",
            ),
        "Market6": (context) => const Market6(
              title: "Market6",
            ),
        "Market7": (context) => const Market7(),
        "Market8": (context) => const Market8(),
      },
    );
  }
}
