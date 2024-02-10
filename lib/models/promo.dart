class PromoteImage {
  final String image;
  PromoteImage({required this.image});

  Map<String, dynamic> toJson() {
    return {'image': image};
  }

  factory PromoteImage.fromJson(Map<String, dynamic> json) {
    return PromoteImage(image: json['image']);
  }
}
