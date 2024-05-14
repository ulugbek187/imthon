import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imthon/data/models/basket_model.dart';
import 'package:imthon/data/models/product_model.dart';
import '../colors/app_colors.dart';

SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  statusBarColor: AppColors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);

String catName(String ctnm){
  if(ctnm == 'Sandwich'){
    return 'sandwich';
  }
  if(ctnm == 'Pizza'){
    return 'pizza';
  }
  if(ctnm == 'Burgers'){
    return 'burger';
  }
  if(ctnm == 'Drink'){
    return 'drinks';
  }
  return '';
}

List<ProductModel> getProductsByCategory(
    List<ProductModel> allProducts, String globalCategoryName) {
  List<ProductModel> categoryProducts = [];
  for (var element in allProducts) {
    if (element.globalCategory == globalCategoryName.toLowerCase()) {
      categoryProducts.add(element);
    }
  }

  return categoryProducts;
}

List<ProductModel> getRecommendedProducts(List<ProductModel> products) {
  List<ProductModel> recommendedProducts = [];
  for (var element in products) {
    if (element.price >= 10.0) {
      recommendedProducts.add(element);
    }
  }
  return recommendedProducts;
}


List<String> splitImages(String input) {
  List<String> images = input.split(' ');
  for (var element in images) {
    debugPrint("$element asdfhas");
  }
  return images;
}


String formatDateWithSlash(String input) {
  if (input.length != 4) {
  }

  DateTime now = DateTime.now();
  int currentYear = now.year;
  int currentMonth = now.month;

  int year = int.parse(input.substring(0, 2));
  int month = int.parse(input.substring(2, 4));

  if (year > currentYear || (year == currentYear && month > currentMonth)) {
  }
  return '$year/$month';
}
