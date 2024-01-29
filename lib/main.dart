import 'package:analytics_dashboard/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Analytics());
}

final darkNotifier = ValueNotifier<bool>(false);

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: darkNotifier,
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: value? ThemeMode.dark : ThemeMode.light,
            home: const Home(),
            routes: {
              'home/':(context) => const Home()
            },
          );
        });
  }
}
