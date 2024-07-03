import 'dart:convert';
import 'dart:developer';
import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductsHelper{
  static final ProductsHelper _instance = ProductsHelper._internal();

  factory ProductsHelper()=> _instance;
  ProductsHelper._internal();

  static Database? _database;

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDatabse();
    return _database!;
  }

  Future<Database> _initDatabse()async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version)async{
    await db.execute(
      '''
      CREATE TABLE products (
      id TEXT PRIMARY KEY,
      data TEXT
      )
      '''
    );
  }

  Future insertProducts(List<Product> products) async{
    final db = await database;

    for( var product in products){
      final existingProduct = await getProductsById(product.prodId!);
      if(existingProduct == null){
        final productJson = jsonEncode(product.toJson());
        await db.insert(
          'products', 
          {
            'id' : product.prodId,
            'data' : productJson,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
          );
          log('successfully uploaded products');
      }
    }
  }

  Future<Product?> getProductsById(String id)async{
    final db = await database;

    final List<Map<String,dynamic>> maps = await db.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      final productJson = maps.first['data'] as String;
      final productMap = json.decode(productJson);
      final product = Product.fromJson(productMap);

      return product;
    } else {
      return null;
    }
  }

  Future<List<Product>> getAllProducts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('products');

    return maps.map((map) {
      final productJson = map['data'] as String;
      final productMap = json.decode(productJson);
      return Product.fromJson(productMap);
    }).toList();
  }
}