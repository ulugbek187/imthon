import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imthon/bloc/evos_bloc/evos_event.dart';
import 'package:imthon/bloc/evos_bloc/evos_state.dart';
import 'package:imthon/data/form_status/form_status.dart';
import 'package:imthon/data/models/product_model.dart';
import 'package:imthon/data/repositories/evos_repositories.dart';
import 'package:imthon/data/response/network_response.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(
    this.productRepo,
  ) : super(
          ProductState.initial(),
        ) {
    on<GetProductsEvent>(
      _listenAllProducts,
    );
    on<GetProductsByCategoryName>(
      _listenProductsByCategoryName,
    );
    // on<GetProductsByModelName>(
    //   _listenProductsByModelName,
    // );
    on<GetRecommendedProductsEvent>(
      _getRecommendedProducts,
    );
    on<GetByCategoryNameProductsEvent>(
      _getCategoryProducts,
    );
    on<SearchProductEvent>(
      _search,
    );
  }

  ProductRepo productRepo;

  _search(SearchProductEvent event, emit) {
    if (event.input.isEmpty) {
      emit(state.copyWith(products: state.products));
    } else {
      emit(state.copyWith(
        products: state.products.where(
          (element) {
            return element.productName
                .toLowerCase()
                .contains(event.input.toLowerCase());
          },
        ).toList(),
      ));
      return false;
    }
  }

  _getCategoryProducts(GetByCategoryNameProductsEvent event, emit) async {
    emit(state.copyWith(
      formStatus: FormStatus.loading,
    ));

    NetworkResponse pizzaRes = await productRepo.getPizzaCategory();

    if (pizzaRes.errorText.isEmpty) {
      emit(state.copyWith(
        pizza: pizzaRes.data,
      ));
    } else {
      emit(state.copyWith(
        formStatus: FormStatus.error,
        errorText: pizzaRes.errorText.toString(),
      ));
    }

    NetworkResponse burgerRes = await productRepo.getBurgerCategory();

    if (burgerRes.errorText.isEmpty) {
      emit(state.copyWith(
        burger: burgerRes.data,
      ));
    } else {
      emit(state.copyWith(
        formStatus: FormStatus.error,
        errorText: burgerRes.errorText,
      ));
    }

    NetworkResponse drinkRes = await productRepo.getDrinkCategory();

    if (drinkRes.errorText.isEmpty) {
      emit(state.copyWith(
        drinks: drinkRes.data,
      ));
    } else {
      emit(state.copyWith(
        formStatus: FormStatus.error,
        errorText: drinkRes.errorText,
      ));
    }

    NetworkResponse sandwichRes = await productRepo.getSandwichCategory();

    if (sandwichRes.errorText.isEmpty) {
      emit(state.copyWith(
        sandwich: sandwichRes.data,
      ));
    } else {
      emit(state.copyWith(
        formStatus: FormStatus.error,
        errorText: sandwichRes.errorText,
      ));
    }


  }

  _getRecommendedProducts(GetRecommendedProductsEvent event, emit) async {
    NetworkResponse networkResponse =
        await productRepo.getRecommendedProducts();

    if (networkResponse.errorText.isEmpty) {
      List<ProductModel> recommendedProducts = [];
      List<ProductModel> products = networkResponse.data;

      for (var element in products) {
        if (element.price > 10.0) {
          recommendedProducts.add(element);
        }

      }

      emit(
        state.copyWith(
          recommendedProducts: recommendedProducts,
        ),
      );
    }
  }

  _listenAllProducts(
    GetProductsEvent event,
    Emitter emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    await emit.onEach(
      productRepo.getAllProducts(),
      onData: (
        List<ProductModel> allProducts,
      ) {
        emit(
          state.copyWith(
            products: allProducts,
            formStatus: FormStatus.success,
          ),
        );
      },
    );
  }

  _listenProductsByCategoryName(
    GetProductsByCategoryName event,
    Emitter emit,
  ) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );
    await emit.onEach(
      productRepo.getProductsByCategoryName(
        event.categoryName,
      ),
      onData: (
        List<ProductModel> products,
      ) {
        emit(
          state.copyWith(products: products, formStatus: FormStatus.success),
        );
      },
    );
  }


}
