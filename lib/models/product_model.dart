// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String id;
  final String title;
  final String type;
  final String description;

  final double price;
  final double rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.price,
    required this.rating,
  });

  //Envia
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'type': type,
      'description': description,
      'price': price,
      'rating': rating,
    };
  }

  //Recebe
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      title: map['title'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
      price: map['price'].toDouble() as double,
      rating: map['rating'].toDouble() as double, 
    );
  }
}
