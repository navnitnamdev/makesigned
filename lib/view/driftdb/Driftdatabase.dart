
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'package:signed/view/driftdb/Usersdbtable.dart';

import '../../listview/User.dart';
import '../Localdata.dart';
part 'Driftdatabase.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Usersdbtable])
class Driftdatabase extends _$Driftdatabase {
  Driftdatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertUser(String name, String mobile) async {
    return await transaction(() async {
      final query = await customInsert(
        'INSERT INTO users (name, mobile) VALUES (?, ?)',
        variables: [Variable.withString(name), Variable.withString(mobile)],
      );
      return query as int;
    });
  }
}

