import 'package:flutter/material.dart';
import 'package:meal_app/pages/category_meals_page.dart';
import 'package:meal_app/pages/home_page.dart';
import 'package:meal_app/pages/meal_detail_screen.dart';
import 'package:meal_app/pages/tabs_page.dart';

import 'pages/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleLarge:
                const TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed')),
      ),
      home: const TabsPage(),
      routes: {
        '/categorie-meals': (ctx) => const CategoryMeals(),
        MealDetail.routeName: (context) => const MealDetail(),
      },
    );
  }
}
