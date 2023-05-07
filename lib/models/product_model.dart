class ProductModel {
  int? productId;
  String productName;
  int price;

  ProductModel(
      {this.productId, required this.productName, required this.price});

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
        productId: data["productid"],
        productName: data["productname"],
        price: data["price"]);
  }

  Map<String, dynamic> toJson() {
    return {"productname": productName, "price": price};
  }
}
