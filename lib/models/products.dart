class Product {
  final String id;
  final String name;
  final String type;
  final String description;
  final String image;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.image,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
}
