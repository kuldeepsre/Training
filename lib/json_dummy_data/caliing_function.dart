import 'dart:convert';




class DataLoader {
  static List<Item> loadItemsFromJson() {
    // Replace this with your actual JSON loading logic
    const jsonString = '''
      [
        {"id": 1, "name": "Item 1"},
        {"id": 2, "name": "Item 2"},
        {"id": 3, "name": "Item 3"}
      ]
    ''';

    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Item.fromJson(json)).toList();
  }
}


class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
