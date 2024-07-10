import 'package:drift/drift.dart';

class Usersdbtable extends Table {

  //IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get mobilenumber => text().withLength(min: 1, max: 15)();

}

// Define the Contacts table
class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get contactName => text().withLength(min: 1, max: 50)();
  TextColumn get contactNumber => text().withLength(min: 1, max: 15)();
  IntColumn get userId => integer().customConstraint('REFERENCES users(id)')();
}