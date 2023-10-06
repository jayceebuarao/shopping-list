import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({
    super.key,
    required this.item,
  });

  final GroceryItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(item.name),
          ),
          Text(item.quantity.toString())
        ],
      ),
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Container(
          color: item.category.color,
        ),
      ),
    );
  }
}
