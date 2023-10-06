import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';
import 'package:shopping_list/data/dummy_items.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
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