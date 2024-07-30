class Product {
  final int id;
  final String name;
  final String price;
  final String url;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.url,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      url: json["url"],
      image: json["image"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "url": url,
      "image": image,
    };
  }
}
