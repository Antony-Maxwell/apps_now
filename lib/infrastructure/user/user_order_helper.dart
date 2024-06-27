import 'package:apps_now/domain/user/orders/orders_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrderDatabaseHelper {
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
  Future<int> insertOrder(Order order) async {
    final Database db = await initDB();
    print("Order added successfully");
    return db.insert('orders', order.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get Order by ID
  Future<Order?> getOrderById(String orderId) async {
    final Database db = await initDB();

    var result = await db.query('orders', where: 'orderId = ?', whereArgs: [orderId]);

    if (result.isNotEmpty) {
      return Order.fromMap(result.first);
    } else {
      return null;
    }
  }

  // Get all orders based on userName and retailerName
  Future<List<Order>> getOrdersByUserAndRetailer(String userName, String retailerName) async {
    final Database db = await initDB();
    
    var result = await db.query(
      'orders',
      where: 'userName = ? AND retailerName = ?',
      whereArgs: [userName, retailerName],
    );
    
    List<Order> orders = result.isNotEmpty
        ? result.map((item) => Order.fromMap(item)).toList()
        : [];
    return orders;
  }

  // Update Order
  Future<int> updateOrder(Order order) async {
    final Database db = await initDB();
    return db.update('orders', order.toMap(), where: 'orderId = ?', whereArgs: [order.orderId]);
  }

  // Delete Order
  Future<int> deleteOrder(String orderId) async {
    final Database db = await initDB();
    return db.delete('orders', where: 'orderId = ?', whereArgs: [orderId]);
  }
}
