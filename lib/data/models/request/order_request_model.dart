import 'dart:convert';

class OrderRequestModel {
    final List<Item> items;
    final String shipper;
    final int shippingCost;
    final int totalPrice;
    final String deliveryAddress;
    final int sellerId;

    OrderRequestModel({
        required this.items,
        required this.shipper,
        required this.shippingCost,
        required this.totalPrice,
        required this.deliveryAddress,
        required this.sellerId,
    });

    factory OrderRequestModel.fromJson(String str) => OrderRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrderRequestModel.fromMap(Map<String, dynamic> json) => OrderRequestModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        shipper: json["shipper"],
        shippingCost: json["shipping_cost"],
        totalPrice: json["total_price"],
        deliveryAddress: json["delivery_address"],
        sellerId: json["seller_id"],
    );

    Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "shipper": shipper,
        "shipping_cost": shippingCost,
        "total_price": totalPrice,
        "delivery_address": deliveryAddress,
        "seller_id": sellerId,
    };
}

class Item {
    final int id;
    final int quantity;
    final int sellerId;

    Item({
        required this.id,
        required this.quantity,
        required this.sellerId,
    });

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        quantity: json["quantity"],
        sellerId: json["sellerId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "quantity": quantity,
        "sellerId": sellerId,
    };
}
