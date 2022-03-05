import 'package:sqflite/sqflite.dart';

mixin DatabaseMixin{

  Future<Database>? initDB();
  Future createDB(Database database, int version);
  Future close();
}