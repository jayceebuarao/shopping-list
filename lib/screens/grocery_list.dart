import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    final itemIndex = _groceryItems.indexOf(item);

    setState(() {
      _groceryItems.removeAt(itemIndex);
    });

    ScaffoldMessenger.of(context)
        .clearSnackBars(); //clear snackbars before showing new snackbars
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Item Deleted.'),
        action: SnackBarAction(
          //option to undo delete action
          label: 'Undo',
          onPressed: () {
            setState(() {
              _groceryItems.insert(itemIndex,
                  item); //insert deleted item back to original position
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: _groceryItems.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(_groceryItems[index].id),
        onDismissed: (direction) {
          _removeItem(_groceryItems[index]);
        },
        child: GroceryListItem(
          item: _groceryItems[index],
        ),
      ),
    );

    if (_groceryItems.isEmpty) {
      content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Nothing to see here! :)',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Try adding an item with +',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Shopping List'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
