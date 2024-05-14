class BasketModel {
  final String productName;
  final String imageUrl;
  final String categoryName;
  final String uuid;
  final String modelName;
  final double price;
  final double allPrice;
  final int countOfProducts;

  BasketModel({
    required this.imageUrl,
    required this.categoryName,
    required this.price,
    required this.productName,
    required this.modelName,
    required this.allPrice,
    required this.countOfProducts,
    required this.uuid,
  });

  BasketModel copyWith({
    String? productName,
    String? imageUrl,
    String? categoryName,
    String? uuid,
    String? modelName,
    double? price,
    double? allPrice,
    int? countOfProducts,
  }) =>
      BasketModel(
        imageUrl: imageUrl ?? this.imageUrl,
        categoryName: categoryName ?? this.categoryName,
        price: price ?? this.price,
        productName: productName ?? this.productName,
        modelName: modelName ?? this.modelName,
        allPrice: allPrice ?? this.allPrice,
        countOfProducts: countOfProducts ?? this.countOfProducts,
        uuid: uuid ?? this.uuid,
      );

  factory BasketModel.fromJson(Map<String, dynamic> json) => BasketModel(
    imageUrl: json['image_url'] as String? ?? '',
    categoryName: json['category_name'] as String? ?? '',
    price: (json['price'] as num? ?? 0).toDouble(),
    productName: json['product_name'] as String? ?? '',
    modelName: json['model_name'] as String? ?? '',
    allPrice: (json['all_price'] as num? ?? 0).toDouble(),
    countOfProducts: json['count_of_product'] as int? ?? 0,
    uuid: json['uuid'] as String? ?? '',
  );

  Map<String, dynamic> toJson() {
    return {
      'product_name': productName,
      'model_name': modelName,
      'uuid': uuid,
      'image_url': imageUrl,
      'category_name': categoryName,
      'price': price,
      'all_price': allPrice,
      'count_of_product': countOfProducts,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'all_price': allPrice,
      'count_of_product': countOfProducts,
    };
  }
}

