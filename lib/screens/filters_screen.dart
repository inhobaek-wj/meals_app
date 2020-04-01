import 'package:flutter/material.dart';

import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetrian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    bool currentValue,
    String description,
    Function updateValue
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),

      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selecction.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),

          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten free',
                  _glutenFree,
                  'Only inclue gluten-free meals.',
                  (newValue) {
                    setState(() {
                        _glutenFree = newValue;
                    });
                  }
                ),

                _buildSwitchListTile(
                  'Lactose free',
                  _lactoseFree,
                  'Only inclue lactose-free meals.',
                  (newValue) {
                    setState(() {
                        _lactoseFree = newValue;
                    });
                  }
                ),

                _buildSwitchListTile(
                  'Vegetrian',
                  _vegetrian,
                  'Only inclue vegetrian meals.',
                  (newValue) {
                    setState(() {
                        _vegetrian = newValue;
                    });
                  }
                ),

                _buildSwitchListTile(
                  'Vegan',
                  _vegan,
                  'Only inclue vegan meals.',
                  (newValue) {
                    setState(() {
                        _vegan = newValue;
                    });
                  }
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
