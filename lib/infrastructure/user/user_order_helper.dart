import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/user/orders/order_service.dart';
import 'package:apps_now/domain/user/orders/orders_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@LazySingleton(as: OrderService)
class OrderDatabaseHelper implements OrderService{

    @override
  Future<Either<MainFailure, List<Orders>>> getOrderList({required String userName, required String retailerName}) async{
    try{
      final result = await getOrdersByUserAndRetailer(userName, retailerName);
      return Right(result);
    }catch(e){
      return const Left(MainFailure.clientFailure());
    }
  }

  final String databaseName = "order.db";
  final String orderTable = 
    "CREATE TABLE orders (orderId TEXT PRIMARY KEY, userName TEXT, retailerName TEXT, userLocation TEXT, productsCount TEXT, totalAmount TEXT, time TEXT)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(orderTable);
      },
    );
  }

  // Insert Order
  Future<int> insertOrder(Orders order) async {
    final Database db = await initDB();
    print("Order added successfully");
    return db.insert('orders', order.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get Order by ID
  Future<Orders?> getOrderById(String orderId) async {
    final Database db = await initDB();

    var result = await db.query('orders', where: 'orderId = ?', whereArgs: [orderId]);

    if (result.isNotEmpty) {
      return Orders.fromMap(result.first);
    } else {
      return null;
    }
  }

  // Get all orders based on userName and retailerName
  Future<List<Orders>> getOrdersByUserAndRetailer(String userName, String retailerName) async {
    final Database db = await initDB();
    
    var result = await db.query(
      'orders',
      where: 'userName = ? AND retailerName = ?',
      whereArgs: [userName, retailerName],
    );
    
    List<Orders> orders = result.isNotEmpty
        ? result.map((item) => Orders.fromMap(item)).toList()
        : [];
    return orders;
  }

  // Update Order
  Future<int> updateOrder(Orders order) async {
    final Database db = await initDB();
    return db.update('orders', order.toMap(), where: 'orderId = ?', whereArgs: [order.orderId]);
  }

  // Delete Order
  Future<int> deleteOrder(String orderId) async {
    final Database db = await initDB();
    return db.delete('orders', where: 'orderId = ?', whereArgs: [orderId]);
  }

}
