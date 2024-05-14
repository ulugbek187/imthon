import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imthon/utils/image/appimage.dart';
import 'package:imthon/utils/styles/size.dart';
import '../../../utils/icons/appIcons.dart';
import '../../../utils/styles/app_text_style.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.image});

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 0.w,
          bottom: 10.h
        ),
        child: Stack(
          children: [
            Image.asset(
              AppImages.izbranoe,
              height: 160.h,
              width: 90.w,
            ),
            Positioned(
              top: 22.h,
              right: 22.w,
              left: 22.w,
              child: Image.asset(
                image,
                width: 54.w,
                height: 42.h,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 82.h,
              left: 22.w,
              right: 22.w,
              child: Text(
                title,
                style: AppTextStyle.width500.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              top: 130.h,
              left: 22.w,
              right: 22.w,
              child: SvgPicture.asset(AppIcons.homeArrowNext),
            ),
          ],
        ),
      ),
    );
  }
}
