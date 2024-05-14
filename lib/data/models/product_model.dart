class ProductModel {
  final String productName;
  final String imageUrl;
  final String deliveryIn;
  final String globalCategory;
  final String categoryName;
  final String masaliqBir;
  final String masaliqIkki;
  final String masaliqUch;
  final String masaliqTort;
  final double price;

  ProductModel({
    required this.imageUrl,
    required this.price,
    required this.productName,
    required this.categoryName,
    required this.globalCategory,
    required this.deliveryIn,
    required this.masaliqBir,
    required this.masaliqIkki,
    required this.masaliqUch,
    required this.masaliqTort,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        imageUrl: json['image_url'] as String? ?? '',
        price: (json['price'] as num? ?? 0).toDouble(),
        productName: json['product_name'] as String? ?? '',
        categoryName: json['category_name'] as String? ?? '',
        globalCategory: json['global_category'] as String? ?? '',
        deliveryIn: json['delivery_in'] as String? ?? '',
        masaliqBir: json['masaliq_bir'] as String? ?? '',
        masaliqIkki: json['masaliq_ikki'] as String? ?? '',
        masaliqUch: json['masaliq_uch'] as String? ?? '',
        masaliqTort: json['masaliq_tort'] as String? ?? '',
      );
}
