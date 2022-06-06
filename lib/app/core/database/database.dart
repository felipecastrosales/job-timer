import 'package:isar/isar.dart';

abstract class Database {
  Future<Isar> openConnection();
}
