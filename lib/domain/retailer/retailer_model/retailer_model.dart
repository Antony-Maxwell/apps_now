class Retailer {
    final String retailerName;
    final String retailerId;
    final String retailerContact;
    final String retailerAddress;
    final String retailerLocation;
    final String? userLocation;
    final String? userName;
    final String? userCurrentTime;

    Retailer({
        required this.retailerName,
        required this.retailerId,
        required this.retailerContact,
        required this.retailerAddress,
        required this.retailerLocation,
        this.userLocation,
        this.userName,
        this.userCurrentTime,
    });

    factory Retailer.fromMap(Map<String, dynamic> json) => Retailer(
        retailerName: json["retailerName"],
        retailerId: json["retailerId"],
        retailerContact: json["retailerContact"],
        retailerAddress: json["retailerAddress"],
        retailerLocation: json["retailerLocation"],
        userLocation: json["userLocation"],
        userName: json["userName"],
        userCurrentTime: json["userCurrentTime"],
    );

    Map<String, dynamic> toMap() => {
        "retailerName": retailerName,
        "retailerId": retailerId,
        "retailerContact": retailerContact,
        "retailerAddress": retailerAddress,
        "retailerLocation": retailerLocation,
        "userLocation": userLocation,
        "userName": userName,
        "userCurrentTime": userCurrentTime,
    };
}
