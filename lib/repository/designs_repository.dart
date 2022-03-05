import 'package:sqflite/sqflite.dart';
import 'package:test_level_project/db/constants.dart';
import 'package:test_level_project/db/database_provider.dart';
import 'package:test_level_project/model/designs_model.dart';
import 'package:test_level_project/repository/designs_repository_mixin.dart';
import 'package:injectable/injectable.dart';

@injectable
class DesignsRepository with DesignsRepositoryMixin {
  final DatabaseProvider databaseProvider = DatabaseProvider.instance;

  List<DesignsModel>? _listDesigns = [];

  // Get Data
  @override
  Future<List<DesignsModel>?> getData() async {
    _listDesigns = await getAllDesigns();
    return _listDesigns!.isEmpty ? [] : _listDesigns;
  }

  /// CRUD

  // Update
  @override
  Future updateDesign(DesignsModel model) async {
    final db = await databaseProvider.database;
    db!.update(
      tableDesigns,
      model.toMap(),
      where: '$columnID = ?',
      whereArgs: [model.id],
    );
  }

  // Create
  @override
  Future createDesign(DesignsModel model) async {
    final db = await databaseProvider.database;
    db!.insert(
      tableDesigns,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Delete
  @override
  Future deleteDesign(int? id) async {
    final db = await databaseProvider.database;
    db!.delete(
      tableDesigns,
      where: '$columnID = ?',
      whereArgs: [id],
    );
  }

  // Read One Element
  @override
  Future<DesignsModel> getOneDesign(int? id) async {
    final db = await databaseProvider.database;
    final data = await db!.query(
      tableDesigns,
      where: '$columnID ? =',
      whereArgs: [id],
    );
    return data.isNotEmpty
        ? DesignsModel.fromMap(data.first)
        : throw Exception('There is no Data');
  }

  // Read All Elements
  @override
  Future<List<DesignsModel>> getAllDesigns() async {
    final db = await databaseProvider.database;
    final data = await db!.query(tableDesigns);
    return data.isNotEmpty
        ? data.map((e) => DesignsModel.fromMap(e)).toList()
        : [];
  }

  List<DesignsModel>? get listDesigns => _listDesigns;
}
