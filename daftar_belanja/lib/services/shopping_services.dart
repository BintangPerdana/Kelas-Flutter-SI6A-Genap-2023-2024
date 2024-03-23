import 'package:firebase_database/firebase_database.dart';

class ShoppingServices {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('shopping_list');

// TODO1: bikin method utk get shopping list
  Stream<Map<String, String>> getShoppingList() {
    return _database.onValue.map((event) {
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, values) {
          items[key] = values['name'] as String;
        });
      }
      return items;
    });
  }

// TODO2: bikin method utk add shopping list
  void addShoppingItem(String itemName) {
    _database.push().set({'name': itemName});
  }

// TODO3: bikin method utk remove shopping list
  Future<void> removeShoppingItem(String key) async {
    await _database.child(key).remove();
  }
}
