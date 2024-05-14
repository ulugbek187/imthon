import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imthon/data/models/basket_model.dart';
import 'package:imthon/data/response/network_response.dart';
import 'package:imthon/utils/constans/app_constans.dart';

class BasketRepo {
  Future<NetworkResponse> addToBasket(BasketModel basketModel) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.basket)
          .get();

      List<BasketModel> baskets = querySnapshot.docs
          .map((e) => BasketModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      bool basketIsExists = false;

      BasketModel bs = BasketModel(
        imageUrl: '',
        categoryName: '',
        price: 0.0,
        productName: '',
        modelName: '',
        allPrice: 0.0,
        countOfProducts: 0,
        uuid: '',
      );

      for (var element in baskets) {
        if (element.productName == basketModel.productName) {
          basketIsExists = true;
          bs = element.copyWith(
            allPrice: element.price * (element.countOfProducts + 1),
            countOfProducts: element.countOfProducts + 1,
          );
          break;
        }
      }

      if (basketIsExists) {
        updateCard(bs);
      } else {
        DocumentReference documentReference = await FirebaseFirestore.instance
            .collection(
          AppConstants.basket,
        )
            .add(
          basketModel.toJson(),
        );
        await FirebaseFirestore.instance
            .collection(
          AppConstants.basket,
        )
            .doc(
          documentReference.id,
        )
            .update({
          "uuid": documentReference.id,
        });
        return NetworkResponse(data: 'success');
      }
      return NetworkResponse(errorText: 'FAILED');
    } on FirebaseException catch (e) {
      return NetworkResponse(
        errorText: e.toString(),
      );
    }
  }

  Future<NetworkResponse> updateCard(BasketModel basketModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(
        AppConstants.basket,
      )
          .doc(
        basketModel.uuid,
      )
          .update(
        basketModel.toJsonForUpdate(),
      );
      return NetworkResponse(data: 'success');
    } on FirebaseException catch (e) {
      return NetworkResponse(
        errorText: e.toString(),
      );
    }
  }

  Future<NetworkResponse> getBaskets() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.basket)
          .get();

      List<BasketModel> baskets = querySnapshot.docs
          .map(
            (e) => BasketModel.fromJson(
          e.data() as Map<String, dynamic>,
        ),
      )
          .toList();

      return NetworkResponse(
        data: baskets,
      );
    } on FirebaseException catch (error) {
      return NetworkResponse(
        errorCode: error.code,
        errorText: error.message ?? '',
      );
    }
  }

  Future<NetworkResponse> deleteCard(String uuid) async {
    try {
      await FirebaseFirestore.instance
          .collection(
        AppConstants.basket,
      )
          .doc(
        uuid,
      )
          .delete();
      return NetworkResponse(data: 'success');
    } on FirebaseException catch (e) {
      return NetworkResponse(
        errorText: e.toString(),
      );
    }
  }

  Stream<List<BasketModel>> getAllBasket() => FirebaseFirestore.instance
      .collection(AppConstants.basket)
      .snapshots()
      .map(
        (event) => event.docs
        .map(
          (e) => BasketModel.fromJson(
        e.data(),
      ),
    )
        .toList(),
  );
}
