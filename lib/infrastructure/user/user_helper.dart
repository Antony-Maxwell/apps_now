import 'package:apps_now/domain/user/user/user_model.dart';
import 'package:apps_now/presentation/auth/splash_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDatabaseHelper {
  final databaseName = "user.db";
  String userTable =
      "CREATE TABLE users (userId INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT UNIQUE, userPassword TEXT, address TEXT)";
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(userTable);
      },
    );
  }

  //login
  Future<bool> login(Users user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
        "select * from users where userName = '${user.userName}' AND userPassword = '${user.userPassword}'");
    if (result.isNotEmpty) {
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(SplashScreen.keyLogin, true);
      return true;
    } else {
      return false;
    }
  }

  //signup
  Future<int> signUP(Users user) async {
    final Database db = await initDB();
    return db.insert('users', user.toMap());
  }
}
