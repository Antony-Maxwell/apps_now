class Users {
  final int? userId;
  final String userName;
  final String userPassword;
  final String? address;

  Users({
    this.userId,
    required this.userName,
    required this.userPassword,
    this.address,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        userName: json["userName"],
        userPassword: json["userPassword"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "userPassword": userPassword,
        "address": address,
      };
}
