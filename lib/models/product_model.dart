class ProductModel {
  final String title;
  final String type;
  final String description;
  final String filename;
  final int height;
  final int width;
  final double price;
  final double rating;
  ProductModel({
    required this.title,
    required this.type,
    required this.description,
    required this.filename,
    required this.height,
    required this.width,
    required this.price,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'type': type,
      'description': description,
      'filename': filename,
      'height': height,
      'width': width,
      'price': price,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
      filename: map['filename'] as String,
      height: map['height'].toInt() as int,
      width: map['width'].toInt() as int,
      price: map['price'].toDouble() as double,
      rating: map['rating'].toDouble() as double,
    );
  }
}
