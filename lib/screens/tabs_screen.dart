import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: const Icon(Icons.star),
                text: 'Favorite',
              )
            ],
          ),
        ),

        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoiresScreen()
          ],
        )
      ),
      initialIndex: 0,
    );
  }

}
