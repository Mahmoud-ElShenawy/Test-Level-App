import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_level_project/db/constants.dart';
import 'package:test_level_project/db/database_mixin.dart';

// Static Singleton
class DatabaseProvider with DatabaseMixin {
  static final DatabaseProvider instance = DatabaseProvider._init();

  DatabaseProvider._init();

  static Database? _database;

  // Database Null Safety Guard
  Future<Database>? get database async {
    if (_database != null) _database;
    _database = await initDB();
    return _database!;
  }

  // Determine Location of Database in Filesystem & Open Database
  @override
  Future<Database>? initDB() async {
    String path = join(await getDatabasesPath(), 'LocalDatabase.db');
    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  // Create Tables in Database
  @override
  Future createDB(Database database, int version) async {
    await database.execute('''  
    CREATE TABLE $tableDesigns (
    $columnID $idType,
    $columnDesignPath $textType,
    $columnSelectedImage $blobType
    )
    ''');
  }

  // Close Database
  @override
  Future close() async {
    final db = await instance.database;
    db?.close();
  }
}
