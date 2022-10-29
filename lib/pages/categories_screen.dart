import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';

import '../models/categories_model.dart';
import '../widgets/category_items_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Categories> categories = DUMMY_CATEGORIES.map((e) {
      return Categories(id: e.id, title: e.title, color: e.color);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Test title')),
      body: GridView.builder(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.10,
        ),
        itemBuilder: (context, i) => CategoryItem(
            categories[i].id, categories[i].title, categories[i].color),
        itemCount: categories.length,
      ),
    );
  }
}
