import 'package:equatable/equatable.dart';
import 'package:imthon/data/form_status/form_status.dart';
import 'package:imthon/data/models/product_model.dart';

final class ProductState extends Equatable {
  final List<ProductModel> products;
  final List<ProductModel> sandwich;
  final List<ProductModel> pizza;
  final List<ProductModel> burger;
  final List<ProductModel> drinks;
  final List<ProductModel> recommendedProducts;
  final FormStatus formStatus;
  final String errorText;
  final String statusMessage;

  const ProductState({
    required this.formStatus,
    required this.statusMessage,
    required this.errorText,
    required this.products,
    required this.recommendedProducts,
    required this.sandwich,
    required this.pizza,
    required this.drinks,
    required this.burger,
  });

  ProductState copyWith({
    String? errorText,
    String? statusMessage,
    FormStatus? formStatus,
    List<ProductModel>? products,
    List<ProductModel>? sandwich,
    List<ProductModel>? pizza,
    List<ProductModel>? drinks,
    List<ProductModel>? burger,
    List<ProductModel>? recommendedProducts,
  }) =>
      ProductState(
        sandwich: sandwich ?? this.sandwich,
        formStatus: formStatus ?? this.formStatus,
        pizza: pizza ?? this.pizza,
        statusMessage: statusMessage ?? this.statusMessage,
        errorText: errorText ?? this.errorText,
        products: products ?? this.products,
        recommendedProducts: recommendedProducts ?? this.recommendedProducts,
        drinks: drinks ?? this.drinks,
        burger: burger ?? this.burger,
      );

  static ProductState initial() => const ProductState(
        formStatus: FormStatus.pure,
        statusMessage: '',
        errorText: '',
        products: [],
        recommendedProducts: [],
        sandwich: [],
        pizza: [],
        drinks: [],
        burger: [],
      );

  @override
  List<Object> get props => [
        products,
        formStatus,
        errorText,
        statusMessage,
        sandwich,
        pizza,
        burger,
        drinks,
      ];
}
