class Product {
  final String id;
  final String name;
  final double originalPrice;
  final double discountedPrice;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageUrl,
    required this.category,
  });
}
