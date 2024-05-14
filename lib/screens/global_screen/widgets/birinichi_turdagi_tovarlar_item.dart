import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imthon/utils/colors/app_colors.dart';
import 'package:imthon/utils/image/appimage.dart';
import 'package:imthon/utils/styles/app_text_style.dart';
import 'package:imthon/utils/styles/size.dart';

import '../../../utils/icons/appIcons.dart';

class OneMethodTovarITem extends StatelessWidget {
  const OneMethodTovarITem(
      {super.key,
      required this.image,
      required this.firstTitle,
      required this.secondTitle,
      required this.onTap});

  final String image;
  final String firstTitle;
  final String secondTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                width: 130.w,
                height: 140.h,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              firstTitle,
              style: AppTextStyle.width400
                  .copyWith(fontSize: 14.w, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Text(
              secondTitle,
              style: AppTextStyle.width400.copyWith(
                fontSize: 14.w,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}

class TwoMethodTovarITem extends StatelessWidget {
  const TwoMethodTovarITem(
      {super.key,
      required this.image,
      required this.firstTitle,
      required this.secondTitle,
      required this.onTap});

  final String image;
  final String firstTitle;
  final String secondTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              imageUrl: image,
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
              firstTitle,
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
                  secondTitle,
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
  }
}

// Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.grey,
//             width: 1.w,
//           ),
//           borderRadius: BorderRadius.circular(10.w),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 8.h),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child:CachedNetworkImage(
//                 imageUrl: image,
//                 placeholder: (context, url) => const CircularProgressIndicator(),
//                 errorWidget: (context, url, error) =>  const Icon(Icons.error, color: Colors.red,),
//                 width: 130.w,
//                 height: 140.h,
//               ),
//             ),
//             SizedBox(height: 5.h),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25.w),
//               child: Text(
//                 firstTitle,
//                 style: AppTextStyle.width400
//                     .copyWith(fontSize: 14.w, color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 5.h),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Text(
//                 secondTitle,
//                 style: AppTextStyle.width400.copyWith(
//                   fontSize: 14.w,
//                   color: Colors.grey,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             SizedBox(height: 14.h),
//           ],
//         ),
//       ),

class ThirdMethodTovarITem extends StatelessWidget {
  const ThirdMethodTovarITem(
      {super.key,
      required this.image,
      required this.firstTitle,
      required this.secondTitle});

  final String image;
  final String firstTitle;
  final String secondTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            Center(child: Image.asset(image)),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Text(
                firstTitle,
                style: AppTextStyle.width400
                    .copyWith(fontSize: 14.w, color: Colors.black),
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Text(
                secondTitle,
                style: AppTextStyle.width400.copyWith(
                  fontSize: 14.w,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}

class FourMethodTovarITem extends StatelessWidget {
  const FourMethodTovarITem(
      {super.key,
      required this.image,
      required this.firstTitle,
      required this.secondTitle,
      required this.onTap});

  final String image;
  final String firstTitle;
  final String secondTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                width: 130.w,
                height: 140.h,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              firstTitle,
              style: AppTextStyle.width400
                  .copyWith(fontSize: 14.w, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                color: Colors.red.withOpacity(0.5),
              ),
              child: Text(
                secondTitle,
                style: AppTextStyle.width400.copyWith(
                  fontSize: 14.w,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}

class FirstProductsITem extends StatelessWidget {
  const FirstProductsITem({
    super.key,
    required this.image,
    required this.firstTitle,
    required this.secondTitle,
    required this.onTap,
  });

  final String image;
  final String firstTitle;
  final String secondTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
              width: 130.w,
              height: 140.h,
            ),
            SizedBox(height: 5.h),
            Text(
              firstTitle,
              style: AppTextStyle.width500.copyWith(
                fontSize: 13.w,
                fontWeight: FontWeight.w400,
                color: AppColors.c1C1C1C,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              secondTitle,
              style: AppTextStyle.width500.copyWith(
                fontSize: 13.w,
                color: AppColors.c909499,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}
