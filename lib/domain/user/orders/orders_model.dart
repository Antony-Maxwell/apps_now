
class Order {
    final String orderId;
    final String userName;
    final String retailerName;
    final String userLocation;
    final String productsCount;
    final String totalAmount;
    final String time;

    Order({
        required this.orderId,
        required this.userName,
        required this.retailerName,
        required this.userLocation,
        required this.productsCount,
        required this.totalAmount,
        required this.time,
    });

    factory Order.fromMap(Map<String, dynamic> json) => Order(
        orderId: json["orderId"],
        userName: json["userName"],
        retailerName: json["retailerName"],
        userLocation: json["userLocation"],
        productsCount: json["productsCount"],
        totalAmount: json["totalAmount"],
        time: json["time"],
    );

    Map<String, dynamic> toMap() => {
        "orderId": orderId,
        "userName": userName,
        "retailerName": retailerName,
        "userLocation": userLocation,
        "productsCount": productsCount,
        "totalAmount": totalAmount,
        "time": time,
    };
}
