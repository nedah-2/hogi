class Option {
  final int count;
  final int price;

  Option({required this.count, required this.price});

  Map<String, dynamic> toJson() {
    return {'count': count, 'price': price};
  }

  factory Option.fromJson(Map json) {
    return Option(count: json['count'], price: json['price']);
  }
}
