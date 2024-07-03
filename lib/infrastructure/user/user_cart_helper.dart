import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/user/cart_model/cart_model.dart';
import 'package:apps_now/domain/user/cart_model/cart_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@LazySingleton(as: CartService)
class CartDatabaseHelper implements CartService{

  @override
  Future<Either<MainFailure, List<Cart>>> getCartList({required String userName, required String retailerName}) async{
    try{
      final result = await getCartItemsByUserNameAndRetailerName(userName, retailerName);
      return Right(result);
    }catch (e){
      return const Left(MainFailure.clientFailure());
    }
  }


  final String databaseName = "cart.db";
  final String cartTable =
      "CREATE TABLE carts (userName TEXT, retailerName TEXT, productName TEXT, productPrice TEXT, cartQuantity TEXT, currentLocation TEXT, totalAmount TEXT)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(cartTable);
      },
    );
  }

  // Insert Cart Item
  Future<int> insertCart(Cart cart, BuildContext context) async {
    final Database db = await initDB();

    // Check if the product is already in the cart for the specific user and retailer
    var existingCartItems = await db.query(
      'carts',
      where: 'userName = ? AND retailerName = ? AND productName = ?',
      whereArgs: [cart.userName, cart.retailerName, cart.productName],
    );

    if (existingCartItems.isNotEmpty) {
      // Product is already in the cart, show a message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 183, 153, 225),
          behavior: SnackBarBehavior.floating,
          content: Text('Product is already in the cart',
          style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
      return 0;
    } else {
      // Product is not in the cart, proceed with the insertion
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromARGB(255, 183, 153, 225),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Product added to cart',
            style: TextStyle(
              color: Colors.black,
            ),
          )));
      return db.insert('carts', cart.toMap());
    }
  }

  // Get Cart Items by UserName and RetailerName
  Future<List<Cart>> getCartItemsByUserNameAndRetailerName(
      String userName, String retailerName) async {
    final Database db = await initDB();

    var result = await db.query(
      'carts',
      where: 'userName = ? AND retailerName = ?',
      whereArgs: [userName, retailerName],
    );

    List<Cart> cartItems = result.isNotEmpty
        ? result.map((item) => Cart.fromMap(item)).toList()
        : [];
    return cartItems;
  }

  // Update Cart Item
  Future<int> updateCart(Cart cart) async {
    final Database db = await initDB();
    return db.update('carts', cart.toMap(),
        where: 'userName = ? AND productName = ?',
        whereArgs: [cart.userName, cart.productName]);
  }

  // Delete Cart Item
  Future<int> deleteCart(String userName, String productName) async {
    final Database db = await initDB();
    return db.delete('carts',
        where: 'userName = ? AND productName = ?',
        whereArgs: [userName, productName]);
  }
  
    // New method to delete all cart items by userName and retailerName
  Future<int> deleteAllCartItems(String userName, String retailerName) async {
    final Database db = await initDB();
    return db.delete('carts',
        where: 'userName = ? AND retailerName = ?',
        whereArgs: [userName, retailerName]);
  }

}
