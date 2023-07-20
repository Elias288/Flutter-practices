import 'package:flutter_crud/utils/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  List<Contact> contacts = [];

  final _myBox = Hive.box('contactsBox');

  void loadData() {
    if (_myBox.get("contacts") != null) {
      contacts = _myBox.get("contacts")?.cast<Contact>() ?? [];
    }
  }

  void updateDataBase() {
    _myBox.put("contacts", contacts);
  }
}
