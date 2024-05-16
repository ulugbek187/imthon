import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imthon/bloc/evos_bloc/evos_bloc.dart';
import 'package:imthon/bloc/evos_bloc/evos_state.dart';
import 'package:imthon/screens/category_screen/widgets/sort_items.dart';
import 'package:imthon/screens/detail_screen/detail_screen.dart';
import 'package:imthon/screens/global_screen/widgets/my_text_field.dart';
import 'package:imthon/screens/global_screen/widgets/search_items.dart';
import 'package:imthon/screens/routes.dart';
import 'package:imthon/utils/functions/utility_functions.dart';
import '../../bloc/evos_bloc/evos_event.dart';
import '../../data/models/product_model.dart';
import '../../utils/icons/appIcons.dart';
import '../../utils/styles/app_text_style.dart';
import '../../utils/styles/size.dart';
import 'widgets/category_list_items.dart';
import 'widgets/grid_view_items.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});

  final String category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isGridView = true;
  TextEditingController textEditingController = TextEditingController();
  List<ProductModel> ctPr = [];

  _getCategoryProductsForCT(List<ProductModel> pr, String categoryName) {
    ctPr = getProductsByCategory(
      pr,
      categoryName,
    );
  }

  @override
  void initState() {
    Future.microtask(
      () => context.read<ProductBloc>().add(
            GetProductsEvent(),
          ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
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
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.favourite,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            _getCategoryProductsForCT(
              state.products,
              catName(widget.category),
            );
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: ItemSearch(
                          items: context.read<ProductBloc>().state.products,
                        ), // Pass your list of items here
                      );
                    },
                    child: MyTextField(
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
                  SizedBox(height: 10.h),
                  SortItems(
                    onGridViewPressed: () {
                      setState(() {
                        isGridView = true;
                      });
                    },
                    onListViewPressed: () {
                      setState(() {
                        isGridView = false;
                      });
                    },
                  ),
                  SizedBox(height: 10.h),
                  isGridView
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio:
                                0.7, // Adjust aspect ratio as needed
                          ),
                          itemCount: widget.category == 'All'
                              ? state.products.length
                              : ctPr.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GridViewContainer(
                              image: widget.category == 'All'
                                  ? state.products[index].imageUrl
                                  : ctPr[index].imageUrl,
                              price: widget.category == 'All'
                                  ? state.products[index].price.toString()
                                  : ctPr[index].price.toString(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                      productModel: widget.category == 'All'
                                          ? state.products[index]
                                          : ctPr[index],
                                    ),
                                  ),
                                );
                              },
                              productName: widget.category == 'All'
                                  ? state.products[index].productName
                                  : ctPr[index].productName,
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.category == 'All'
                              ? state.products.length
                              : ctPr.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListViewContainer(
                              image: widget.category == 'All'
                                  ? state.products[index].imageUrl
                                  : ctPr[index].imageUrl,
                              price: widget.category == 'All'
                                  ? state.products[index].price.toString()
                                  : ctPr[index].price.toString(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                      productModel: widget.category == 'All'
                                          ? state.products[index]
                                          : ctPr[index],
                                    ),
                                  ),
                                );
                              },
                              productName: widget.category == 'All'
                                  ? state.products[index].productName
                                  : ctPr[index].productName,
                              order: widget.category == 'All'
                                  ? state.products[index].globalCategory
                                  : ctPr[index].globalCategory,
                            );
                          },
                        ),
                  SizedBox(height: 10.h),
                  Text(
                    "You may also Like",
                    style: AppTextStyle.width500
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          state.products.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridViewContainer(
                              image: state.products[index].imageUrl,
                              price: state.products[index].price.toString(),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.productDetailScreen,
                                  arguments: state.products[index],
                                );
                              },
                              productName: state.products[index].productName,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
