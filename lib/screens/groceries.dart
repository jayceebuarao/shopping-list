import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';
import 'package:shopping_list/data/dummy_items.dart';

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({super.key});

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GroceryListItem(
          item: groceryItems[index],
        ),
        itemCount: groceryItems.length,
      ),
    );
  }
}
