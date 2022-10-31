import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/widgets/main_draw.dart';

class FilterPage extends StatefulWidget {
  const FilterPage(this.currentFilter, this.saveFilters, {super.key});
  static const routeName = '/FilterPage';

  final Function saveFilters;
  final Map<String, bool> currentFilter;
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactose = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;
    _lactose = widget.currentFilter['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> _filters = {
      'gluten': _glutenFree,
      'lactose': _vegetarian,
      'vegan': _vegan,
      'vegetarian': _lactose
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
        actions: [
          IconButton(
              onPressed: () => widget.saveFilters(_filters),
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (value) => setState(() {
                    _glutenFree = value;
                  }),
                  title: const Text('Gluten-free'),
                  subtitle: const Text('Only include fluten-free meals.'),
                ),
                SwitchListTile(
                  value: _lactose,
                  onChanged: (value) => setState(() {
                    _lactose = value;
                  }),
                  title: const Text('Lactose-free'),
                  subtitle: const Text('Only include lactose-free meals.'),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (value) => setState(() {
                    _vegetarian = value;
                  }),
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Only include vegetarian meals.'),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (value) => setState(() {
                    _vegan = value;
                  }),
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include vegan meals.'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
