import 'package:hooker_cooker/model/ingredient.dart';
import 'package:hooker_cooker/model/retseptmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('retseptlar.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2, 
      onCreate: _createDB,
      onUpgrade: _upgradeDB, 
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ingredients (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        amount TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE recipes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imagePath TEXT NOT NULL,
        nomi TEXT NOT NULL,
        portsiya TEXT NOT NULL,
        vaqt TEXT NOT NULL,
        masalliqlar TEXT NOT NULL,
        qadamlar TEXT NOT NULL,
        audio TEXT,
        sersa TEXT
      )
    ''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE recipes ADD COLUMN audio TEXT;');
      await db.execute('ALTER TABLE recipes ADD COLUMN sersa TEXT;');
    }
  }

  Future<int> insertIngredient(Ingredient ingredient) async {
    final db = await instance.database;
    return await db.insert('ingredients', ingredient.toMap());
  }

  Future<List<Ingredient>> getAllIngredients() async {
    final db = await instance.database;
    final result = await db.query('ingredients');
    return result.map((json) => Ingredient.fromMap(json)).toList();
  }

  Future<int> deleteIngredient(int id) async {
    final db = await instance.database;
    return await db.delete(
      'ingredients',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertRecipe(RetseptModel recipe) async {
    final db = await instance.database;
    return await db.insert('recipes', recipe.toMap());
  }

  Future<List<RetseptModel>> getSavedRecipes() async {
    final db = await instance.database;
    final result = await db.query('recipes');
    return result.map((json) => RetseptModel.fromMap(json)).toList();
  }
}