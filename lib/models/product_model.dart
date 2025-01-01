class Product {
  final String?
      image; // Made image nullable to handle cases where image might be missing
  final String weight;
  final String?
      category; 
  final String title;
  final double amount;
  final String id;
  final String description;

  Product({
    this.image, // Made image optional
    required this.weight,
    required this.title,
    required this.amount,
    this.category, // Made categories optional
    required this.id,
    this.description =
        '', // Default empty string for description if not provided
  }) {
    // Validation or assertion if needed
    assert(title.isNotEmpty, 'Title should not be empty');
    assert(id.isNotEmpty, 'ID should not be empty');
  }
}
