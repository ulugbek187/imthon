import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imthon/screens/basket/basket_screen.dart';
import 'package:imthon/screens/category_screen/category_screen.dart';
import 'package:imthon/screens/profile_screen/profile_screen.dart';
import 'package:imthon/utils/colors/app_colors.dart';
import 'package:imthon/utils/styles/size.dart';

import '../utils/icons/appIcons.dart';
import 'global_screen/global_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = const [
    GlobalScreen(),
    CategoryScreen(category: "All"),
    // (),
    CategoryScreen(category: "All"),
    BasketScreen(),
    ProfileScreen(),
  ];

  int activeIndex = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: AppColors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: activeIndex,
        onTap: (newIndex) {
          activeIndex = newIndex;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.home,
              height: 30.h,
              width: 30.w,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.home,
              height: 30.h,
              width: 30.w,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.carts,
              height: 24.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.carts,
              height: 24.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Categories"
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.favourite,
              height: 24.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.favourite,
              height: 24.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Like"
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.buy,
              height: 24.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.buy,
              height: 24.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "buy"
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.profile,
              height: 24.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.profile,
              height: 24.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile"
          ),
        ],
      ),
    );
  }
}
