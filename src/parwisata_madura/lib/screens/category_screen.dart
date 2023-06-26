import 'package:flutter/material.dart';

import '../components/list_category.dart';
import '../dummy_data.dart';
import '../page/crud.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
          
            },
          )
        ],
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        children: CATEGORIES_DUMMY_DATA
            .map((cat) =>
                ListCategory(cat.id, cat.title, cat.description, cat.image))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
