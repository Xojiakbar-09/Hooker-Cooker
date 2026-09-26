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
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // 1. Masalliqlar jadvali
    await db.execute('''
      CREATE TABLE ingredients (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        amount TEXT NOT NULL
      )
    ''');

    // 2. RETSEPTLAR JADVALI (Shu yetishmayotgan edi)
    await db.execute('''
      CREATE TABLE recipes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imagePath TEXT NOT NULL,
        nomi TEXT NOT NULL,
        portsiya TEXT NOT NULL,
        vaqt TEXT NOT NULL,
        masalliqlar TEXT NOT NULL,
        qadamlar TEXT NOT NULL
      )
    ''');
  }

  // --- MASALLIQLAR UCHUN METODLAR ---
  
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

  // --- RETSEPTLAR UCHUN YANGI METODLAR (Xatoni yo'qotadi) ---

  // Retseptni bazaga saqlash
  Future<int> insertRecipe(RetseptModel recipe) async {
    final db = await instance.database;
    return await db.insert('recipes', recipe.toMap());
  }

  // Barcha saqlangan retseptlarni o'qib olish
  Future<List<RetseptModel>> getSavedRecipes() async {
    final db = await instance.database;
    final result = await db.query('recipes');
    return result.map((json) => RetseptModel.fromMap(json)).toList();
  }
}