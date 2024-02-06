import 'package:dreambiztech/bloc/selection_bloc.dart';
import 'package:dreambiztech/json_dummy_data/caliing_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultipleSelectionScreen extends StatefulWidget {
  const MultipleSelectionScreen({super.key});

  @override
  _MultipleSelectionScreenState createState() =>
      _MultipleSelectionScreenState();
}

class _MultipleSelectionScreenState extends State<MultipleSelectionScreen> {
  final SelectionBloc _selectionBloc =
      SelectionBloc(DataLoader.loadItemsFromJson());

  @override
  void dispose() {
    _selectionBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Selection'),
      ),
      body: StreamBuilder<List<int>>(
        stream: _selectionBloc.selectedItemsStream,
        builder: (context, snapshot) {
          List<int> selectedItems = snapshot.data ?? [];
          List<Item> items = _selectionBloc.getItems();

          /*      return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final Item currentItem = items[index];

              return ListTile(
                title: Text('Item ${currentItem.id}: ${currentItem.name}'),
                onTap: () {
                  _selectionBloc.toggleSelection(currentItem.id);
                },
                tileColor: selectedItems.contains(currentItem.id)
                    ? Colors.blue.withOpacity(0.3)
                    : null,
              );
            },
          );*/
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final Item currentItem = items[index];

              return ListTile(
                title: Text('Item ${currentItem.id}: ${currentItem.name}'),
                leading: Checkbox(
                  value: selectedItems.contains(currentItem.id),
                  onChanged: (bool? value) {
                    _selectionBloc.toggleSelection(currentItem.id);
                  },
                ),
                tileColor: selectedItems.contains(currentItem.id)
                    ? Colors.blue.withOpacity(0.3)
                    : null,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Retrieve selected items and perform the submit action
          List<Item> selectedItems = _selectionBloc.getSelectedItems();
          print('Selected Items: ${selectedItems}');
          for (var item in selectedItems) {
            print('Selected Item: ${item.id} - ${item.name}');
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
