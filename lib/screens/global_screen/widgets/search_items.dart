import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imthon/data/models/product_model.dart';
import 'package:imthon/utils/styles/size.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/AppIcons.dart';
import '../../../utils/image/appimage.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../detail_screen/detail_screen.dart';

class ItemSearch extends SearchDelegate<String> {
  final List<ProductModel> items; // List of items to search from

  ItemSearch({required this.items});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          Navigator.pop(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<ProductModel> results = items
        .where((item) => item.productName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                    productModel: results[index]),
              ),
            );
          },
          child: Stack(
            children: [
              Positioned(
                top: 60.h,
                bottom: 40.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.w),
                    topRight: Radius.circular(20.w),
                  ),
                  child: Image.asset(
                    AppImages.podstavka,
                  ),
                ),
              ),
              Positioned(
                left: 10.w,
                right: 10.w,
                child: CachedNetworkImage(
                  imageUrl: items[index].imageUrl,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  width: 100.w,
                  height: 130.h,
                ),
              ),
              Positioned(
                bottom: 90.h,
                left: 20.w,
                child: Text(
                  items[index].productName,
                  style: AppTextStyle.width500.copyWith(fontSize: 18.w),
                ),
              ),
              Positioned(
                bottom: 65.h,
                left: 20.w,
                child: Text(
                  "Starting From",
                  style: AppTextStyle.width300.copyWith(fontSize: 14.w),
                ),
              ),
              Positioned(
                bottom: 45.h,
                left: 20.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index].deliveryIn,
                      style: AppTextStyle.width500
                          .copyWith(fontSize: 14.w, color: Colors.green),
                    ),

                    SvgPicture.asset(AppIcons.plusYellow),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ProductModel> suggestionList = query.isEmpty
        ? []
        : items
        .where((item) => item.productName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                    productModel: suggestionList[index]),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              border: Border.all(
                  width: 1, color: AppColors.c00B517),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  suggestionList[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 84,
                  width: 84,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      suggestionList[index].productName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.c0D6EFD,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "\$${suggestionList[index].price.toString()}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.c0D6EFD,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                              (index) => const Icon(Icons.star,
                              color: Colors.amber),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "7.5",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.amber,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.circle),
                        const SizedBox(width: 8),
                        Text(
                          suggestionList[index].price
                              .toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.c1A72DD,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Free Shipping",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.c1A72DD,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
