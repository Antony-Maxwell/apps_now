class Cart {
    final String userName;
    final String retailerName;
    final String productName;
    final String productPrice;
    final String cartQuantity;
    final String currentLocation;
    final String totalAmount;

    Cart({
        required this.userName,
        required this.retailerName,
        required this.productName,
        required this.productPrice,
        required this.cartQuantity,
        required this.currentLocation,
        required this.totalAmount,
    });

    factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        userName: json["userName"],
        retailerName: json["retailerName"],
        productName: json["productName"],
        productPrice: json["productPrice"],
        cartQuantity: json["cartQuantity"],
        currentLocation: json["currentLocation"],
        totalAmount: json["totalAmount"]
    );

    Map<String, dynamic> toMap() => {
        "userName": userName,
        "retailerName": retailerName,
        "productName": productName,
        "productPrice": productPrice,
        "cartQuantity": cartQuantity,
        "currentLocation": currentLocation,
        "totalAmount": totalAmount,
    };
}
