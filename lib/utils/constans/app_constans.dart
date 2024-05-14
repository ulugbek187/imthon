import 'package:imthon/data/models/global_category_model.dart';
import 'package:imthon/utils/image/appimage.dart';

class AppConstants {
  static const String products = "products";
  static const String basket = "basket";

  static List<GlobalCategoryModel> globalGategories = [
    // "All category",
    // "Gadgets",
    // "Clocthes",
    // "Accessory",

    GlobalCategoryModel(image: AppImages.sandwich, categoryName: "Sandwich"),
    GlobalCategoryModel(image: AppImages.pizza, categoryName: "Pizza"),
    GlobalCategoryModel(image: AppImages.burger, categoryName: "Burgers"),
    GlobalCategoryModel(image: AppImages.drink, categoryName: "Drink"),
  ];
}
