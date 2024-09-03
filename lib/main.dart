import 'package:flutter/material.dart';
import 'package:thewms/common/constants/routes.dart';
import 'package:thewms/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: NamedRoute.home,
      routes: {
        NamedRoute.home: (context) => const HomePage(),
      }
    );
  }
}