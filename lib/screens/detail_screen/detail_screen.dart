import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imthon/bloc/basket/basket_bloc.dart';
import 'package:imthon/bloc/basket/basket_event.dart';
import 'package:imthon/bloc/evos_bloc/evos_bloc.dart';
import 'package:imthon/data/form_status/form_status.dart';
import 'package:imthon/data/models/basket_model.dart';
import 'package:imthon/data/models/product_model.dart';
import 'package:imthon/screens/routes.dart';
import 'package:imthon/utils/colors/app_colors.dart';
import 'package:imthon/utils/image/appimage.dart';
import 'package:imthon/utils/styles/size.dart';
import '../../bloc/evos_bloc/evos_state.dart';
import '../../utils/icons/AppIcons.dart';
import '../../utils/styles/app_text_style.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // List<String> images = splitImages(widget.productModel.imageUrl);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteNames.basketScreen,
              );
            },
            icon: SvgPicture.asset(
              AppIcons.buy,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteNames.basketScreen,
              );
            },
            icon: SvgPicture.asset(
              AppIcons.favourite,
            ),
          ),
        ],
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppImages.detailBak,
                      width: double.infinity,
                      height: 352.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(20.w),
                      width: double.infinity,
                      height: 405.h,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.zero,
                        color: AppColors.white,
                      ),
                      child: Image.network(
                        widget.productModel.imageUrl,
                        height: 305.h,
                        width: width,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.productModel.productName,
                                  style: AppTextStyle.width500.copyWith(
                                      color: AppColors.black, fontSize: 22.w)),
                              Text(
                                "Delivery in ${widget.productModel.deliveryIn.toString()} ",
                                style: AppTextStyle.width500.copyWith(
                                  color: AppColors.cFF9017,
                                  fontSize: 13.w,
                                ),
                              ),
                            ],
                          ),
                          // Spacer(),
                          Text(
                            "\$ ${widget.productModel.price.toString()}",
                            style: AppTextStyle.width700
                                .copyWith(color: Colors.green, fontSize: 32.w),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Ingredients",
                        style: AppTextStyle.width600.copyWith(fontSize: 24.w),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productModel.masaliqBir,
                            style: AppTextStyle.width600.copyWith(
                              fontSize: 20.w,
                              color: Colors.orange,
                            ),
                          ),
                          Text(
                            widget.productModel.masaliqIkki,
                            style: AppTextStyle.width600.copyWith(
                              fontSize: 20.w,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            widget.productModel.masaliqUch,
                            style: AppTextStyle.width600.copyWith(
                              fontSize: 20.w,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          Text(
                            widget.productModel.masaliqTort,
                            style: AppTextStyle.width600.copyWith(
                              fontSize: 20.w,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: GestureDetector(
                    onTap: () {
                      BasketModel basketModel = BasketModel(
                        imageUrl: widget.productModel.imageUrl,
                        categoryName: widget.productModel.categoryName,
                        price: widget.productModel.price,
                        productName: widget.productModel.productName,
                        allPrice: widget.productModel.price,
                        countOfProducts: 1,
                        uuid: '',
                        modelName: '',
                      );

                      context.read<BasketBloc>().add(
                            AddToBasketEvent(
                              basketModel: basketModel,
                            ),
                          );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          40.w,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Add to basket",
                          style: AppTextStyle.width500
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, ProductState state) {
          if (state.formStatus == FormStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                ),
                content: Text(
                  "Basketga bitta mahsulot qoshildi",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.width600
                      .copyWith(fontSize: 20.w, color: Colors.green),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
