import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imthon/utils/styles/app_text_style.dart';
import 'package:imthon/utils/styles/size.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/AppIcons.dart';

class GridViewContainer extends StatelessWidget {
  const GridViewContainer({
    super.key,
    required this.image,
    required this.price,
    required this.onTap,
    required this.productName,
  });

  final String image;
  final String price;
  final String productName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
              width: 100.w,
              height: 100.h,
            ),
            // const SizedBox(height: 10),
            Text(
              productName,
              style: AppTextStyle.width500,
            ),
            SizedBox(height: 5.h),
            Text(
              "Starting From",
              style: AppTextStyle.width500,
            ),
            SizedBox(height: 5.h),
            Text(
              "\$ $price",
              style: AppTextStyle.width500.copyWith(color: Colors.orange),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}
