

class Book {
  final String name;
  final double price;
  Book(this.name, this.price);

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(json['name'], json['price']);
  }
}
