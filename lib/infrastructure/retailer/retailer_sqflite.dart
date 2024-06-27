import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/retailer/retailer_model/retailer_model.dart';
import 'package:apps_now/domain/retailer/retailer_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@LazySingleton(as: RetailerService)
class RetailerDatabaseHelper implements RetailerService {
  @override
  Future<Either<MainFailure, List<Retailer>>> getRetailers()async {
    try{
      final retailersList = await getAllRetailers();
      return Right(retailersList);
    }catch(e){
      return const Left(MainFailure.clientFailure());
    }
  }

  final databaseName = "retailer.db";
  String retailerTable =
      "CREATE TABLE retailers (retailerId TEXT PRIMARY KEY, retailerName TEXT, retailerContact TEXT, retailerAddress TEXT, retailerLocation TEXT, userLocation TEXT, userName TEXT, userCurrentTime TEXT)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(retailerTable);
      },
    );
  }

  // Insert Retailer
  Future<int> insertRetailer(Retailer retailer) async {
    final Database db = await initDB();
    print("retailer added successfully");
    return db.insert('retailers', retailer.toMap());
  }

  // Get Retailer by ID
  Future<Retailer?> getRetailerById(String retailerId) async {
    final Database db = await initDB();

    var result = await db.query('retailers', where: 'retailerId = ?', whereArgs: [retailerId]);

    if (result.isNotEmpty) {
      return Retailer.fromMap(result.first);
    } else {
      return null;
    }
  }

  //get all retailers
  Future<List<Retailer>> getAllRetailers() async {
    final Database db = await initDB();
    
    var result = await db.query('retailers');
    List<Retailer> retailers = result.isNotEmpty
        ? result.map((item) => Retailer.fromMap(item)).toList()
        : [];
    return retailers;
  }

  // Update Retailer
  Future<int> updateRetailer(Retailer retailer) async {
    final Database db = await initDB();
    return db.update('retailers', retailer.toMap(), where: 'retailerId = ?', whereArgs: [retailer.retailerId]);
  }

  // Delete Retailer
  Future<int> deleteRetailer(String retailerId) async {
    final Database db = await initDB();
    return db.delete('retailers', where: 'retailerId = ?', whereArgs: [retailerId]);
  }
}
