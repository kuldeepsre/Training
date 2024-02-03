import 'package:dreambiztech/json_dummy_data/caliing_function.dart';
import 'package:rxdart/rxdart.dart';

class SelectionBloc {
  final _selectedItems = BehaviorSubject<List<int>>.seeded([]);
  final List<Item> _items;

  SelectionBloc(this._items);

  Stream<List<int>> get selectedItemsStream => _selectedItems.stream;

  void toggleSelection(int itemId) {
    List<int> selectedItems = _selectedItems.value ?? [];

    if (selectedItems.contains(itemId)) {
      selectedItems.remove(itemId);
    } else {
      selectedItems.add(itemId);
    }

    _selectedItems.add(selectedItems);
  }

  List<Item> getItems() {
    return _items;
  }
  List<Item> getSelectedItems() {
    return _items.where((item) => _selectedItems.value.contains(item.id)).toList();
  }
  void dispose() {
    _selectedItems.close();
  }
}
