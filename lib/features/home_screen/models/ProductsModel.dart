class ProductsModel {
  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ProductsModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];

    if (json['price'] != null) {
      price = json['price'] is int
          ? (json['price'] as int).toDouble()
          : json['price'] as double?;
    }

    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  Rating.fromJson(dynamic json) {
    rate = (json['rate'] as num?)?.toDouble();
    count = json['count'];
  }
  double? rate;
  int? count;
}
