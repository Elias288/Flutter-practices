import 'package:hive_flutter/hive_flutter.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact {
  Contact({required this.name, required this.phone, required this.surname});

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String surname;

  @HiveField(2)
  final String phone;
}
