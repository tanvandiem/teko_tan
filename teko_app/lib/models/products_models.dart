class Product {
  final String name;
  final int price;
  final String imageSrc;

  Product({required this.name, required this.price, required this.imageSrc});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      imageSrc: json['imageSrc'],
    );
  }
}