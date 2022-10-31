import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/meal_item_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen(this.favouriteMeals, {super.key});

  final List<Meal> favouriteMeals;

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isEmpty
        ? const Center(
            child: Text('You have no favorites yet - start adding some!'),
          )
        : ListView.builder(
            itemCount: favouriteMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                  id: favouriteMeals[index].id,
                  title: favouriteMeals[index].title,
                  imageUrl: favouriteMeals[index].imageUrl,
                  duration: favouriteMeals[index].duration,
                  complexity: favouriteMeals[index].complexity,
                  affordability: favouriteMeals[index].affordability);
            },
          );
  }
}
