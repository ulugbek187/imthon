import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:imthon/data/models/product_model.dart';
import 'package:imthon/data/response/network_response.dart';
import 'package:imthon/utils/constans/app_constans.dart';

class ProductRepo {
  Stream<List<ProductModel>> getAllProducts() => FirebaseFirestore.instance
      .collection(AppConstants.products)
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (e) => ProductModel.fromJson(
                e.data(),
              ),
            )
            .toList(),
      );

  Future<NetworkResponse> getRecommendedProducts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .get();

      List<ProductModel> products = querySnapshot.docs
          .map(
            (e) => ProductModel.fromJson(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();
      return NetworkResponse(
        data: products,
      );
    } on FirebaseException catch (error) {
      return NetworkResponse(
        errorCode: error.code,
        errorText: error.message ?? '',
      );
    }
  }

  Future<NetworkResponse> getPizzaCategory() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .where('global_category', isEqualTo: 'pizza')
          .get();

      List<ProductModel> products = querySnapshot.docs
          .map(
            (e) => ProductModel.fromJson(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();
      debugPrint(products.length.toString());
      debugPrint("Kirdi");
      return NetworkResponse(
        data: products,
      );
    } on FirebaseException catch (error) {
      return NetworkResponse(
        errorCode: error.code,
        errorText: error.message ?? '',
      );
    }
  }

  Future<NetworkResponse> getBurgerCategory() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .where('global_category', isEqualTo: 'burger')
          .get();

      List<ProductModel> products = querySnapshot.docs
          .map(
            (e) => ProductModel.fromJson(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();
      return NetworkResponse(
        data: products,
      );
    } on FirebaseException catch (error) {
      return NetworkResponse(
        errorCode: error.code,
        errorText: error.message ?? '',
      );
    }
  }

  Future<NetworkResponse> getDrinkCategory() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .where('global_category', isEqualTo: 'drinks')
          .get();

      List<ProductModel> products = querySnapshot.docs
          .map(
            (e) => ProductModel.fromJson(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();
      return NetworkResponse(
        data: products,
      );
    } on FirebaseException catch (error) {
      return NetworkResponse(
        errorCode: error.code,
        errorText: error.message ?? '',
      );
    }
  }

  Future<NetworkResponse> getSandwichCategory() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.products)
          .where('global_category', isEqualTo: 'sandwich')
          .get();

      List<ProductModel> products = querySnapshot.docs
          .map(
            (e) => ProductModel.fromJson(
          e.data() as Map<String, dynamic>,
        ),
      )
          .toList();
      return NetworkResponse(
        data: products,
      );
    } on FirebaseException catch (error) {
      return NetworkResponse(
        errorCode: error.code,
        errorText: error.message ?? '',
      );
    }
  }


  Stream<List<ProductModel>> getProductsByCategoryName(String categoryName) =>
      FirebaseFirestore.instance
          .collection(AppConstants.products)
          .where(
            "category_name",
            isEqualTo: categoryName,
          )
          .snapshots()
          .map(
            (event) => event.docs
                .map(
                  (e) => ProductModel.fromJson(
                    e.data(),
                  ),
                )
                .toList(),
          );

  // Stream<List<ProductModel>> getProductsByModelName(String modelName) =>
  //     FirebaseFirestore.instance
  //         .collection(AppConstants.products)
  //         .where(
  //           "model_name",
  //           isEqualTo: modelName,
  //         )
  //         .snapshots()
  //         .map(
  //           (event) => event.docs
  //               .map(
  //                 (e) => ProductModel.fromJson(
  //                   e.data(),
  //                 ),
  //               )
  //               .toList(),
  //         );
}
