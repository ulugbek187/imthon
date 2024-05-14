import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imthon/bloc/evos_bloc/evos_bloc.dart';
import 'package:imthon/bloc/evos_bloc/evos_event.dart';
import 'package:imthon/bloc/evos_bloc/evos_state.dart';
import 'package:imthon/screens/detail_screen/detail_screen.dart';
import 'package:imthon/screens/global_screen/widgets/birinichi_turdagi_tovarlar_item.dart';
import 'package:imthon/screens/global_screen/widgets/category_button.dart';
import 'package:imthon/screens/global_screen/widgets/my_text_field.dart';
import 'package:imthon/screens/global_screen/widgets/search_items.dart';
import 'package:imthon/screens/routes.dart';
import 'package:imthon/utils/colors/app_colors.dart';
import 'package:imthon/utils/image/appimage.dart';
import 'package:imthon/utils/styles/size.dart';
import '../../utils/constans/app_constans.dart';
import '../../utils/icons/appIcons.dart';
import '../../utils/styles/app_text_style.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<ProductBloc>().add(
            GetProductsEvent(),
          ),
    );
    super.initState();
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(
          GetByCategoryNameProductsEvent(),
        );
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Row(
            children: [
              SizedBox(
                width: 14.w,
              ),

              Image.asset(
                AppImages.avatar,
                width: 43.w,
                height: 43.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Food Evos Senter",
                style: AppTextStyle.width500.copyWith(
                  fontSize: 18.w,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => BasketScreen()));
              },
              icon: SvgPicture.asset(AppIcons.menu),
            ),
          ],
        ),
        backgroundColor: AppColors.white,
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: 30.w, vertical: 28.h),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Food",
                //         style: AppTextStyle.width500.copyWith(
                //           fontSize: 22.w,
                //         ),
                //       ),
                //       Text(
                //         "Evos Senter",
                //         style: AppTextStyle.width800.copyWith(
                //           fontSize: 22.w,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 30.w, right: 30.w, bottom: 28.h, top: 28.h),
                  child:
                  GestureDetector(
                    onTap: (){
                      showSearch(
                        context: context,
                        delegate: ItemSearch(items:context.read<ProductBloc>().state.products), // Pass your list of items here
                      );
                    },
                    child:  MyTextField(
                      controller: textEditingController,
                      type: TextInputType.text,
                      iconPath: AppIcons.search,
                      hinText: "Search",
                      onChanged: (v) async {
                        _searchProduct();
                        await Future.delayed(const Duration(seconds: 5));
                        context.read<ProductBloc>().add(
                          GetProductsEvent(),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                        ),
                        child: Text(
                          "Categories",
                          style: AppTextStyle.width700.copyWith(fontSize: 24.w),
                        ),
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              AppConstants.globalGategories.length,
                              (index) => CategoryButton(
                                title: AppConstants
                                    .globalGategories[index].categoryName,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.categoryScreen,
                                    arguments: AppConstants
                                        .globalGategories[index].categoryName,
                                  );
                                },
                                image:
                                    AppConstants.globalGategories[index].image,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                        child: Text(
                          "Recommended items",
                          style: AppTextStyle.width600.copyWith(fontSize: 18.w),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: height / 1.4,
                          child: GridView.count(
                            // primary: false,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 20.h,
                            ),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.68,
                            children: [
                              ...List.generate(
                                state.products.length,
                                (index) => TwoMethodTovarITem(
                                  image: state.products[index].imageUrl,
                                  firstTitle: state.products[index].productName,
                                  secondTitle:
                                      "\$ ${state.products[index].price}",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                          productModel: state.products[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _searchProduct() {
    context.read<ProductBloc>().add(
          SearchProductEvent(
            input: textEditingController.text,
          ),
        );
  }

  @override
  void deactivate() {
    textEditingController.dispose();
    super.deactivate();
  }
}
