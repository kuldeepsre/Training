import 'dart:convert';

import 'package:dreambiztech/json_dummy_data/caliing_function.dart';
import 'package:rxdart/rxdart.dart';

class OrderBloc {
  final _orderList = BehaviorSubject<List<Item>>.seeded([]);
  final _filterQuery = BehaviorSubject<String>.seeded('');
  final _sortOrder = BehaviorSubject<bool>.seeded(true);

  Stream<List<Item>> get orderedListStream => _orderList.stream;
  Stream<String> get filterQueryStream => _filterQuery.stream;
  Stream<bool> get sortOrderStream => _sortOrder.stream;

  void updateFilterQuery(String query) {
    _filterQuery.add(query);
    updateOrderList(); // Trigger an update when the filter changes
  }

  void toggleSortOrder() {
    _sortOrder.add(!_sortOrder.value);
    updateOrderList(); // Trigger an update when the sort order changes
  }

  void updateOrderList() {
    // Apply filter
    List<Item> filteredList = _filterList(_orderList.value, _filterQuery.value);

    // Apply sorting
    List<Item> orderedList = _sortList(filteredList, _sortOrder.value);

    _orderList.add(orderedList);
  }

  List<Item> _filterList(List<Item> list, String query) {
    if (query.isEmpty) {
      return list;
    }
    return list.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  List<Item> _sortList(List<Item> list, bool ascending) {
    List<Item> sortedList = List.from(list);
    sortedList.sort((a, b) => ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
    return sortedList;
  }

  Future<void> loadItemsFromJson() async {
    // Simulating loading data from a JSON source
    const jsonString = '''
      [
        {"id": 1, "name": "Apple"},
        {"id": 2, "name": "Banana"},
        {"id": 3, "name": "Orange"},
        {"id": 4, "name": "Grapes"}
      ]
    ''';

    final List<dynamic> jsonList = json.decode(jsonString);
    final List<Item> itemList = jsonList.map((json) => Item.fromJson(json)).toList();

    _orderList.add(itemList);
  }

  void dispose() {
    _orderList.close();
    _filterQuery.close();
    _sortOrder.close();
  }
}
