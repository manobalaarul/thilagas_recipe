import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/design/shimmer.dart';
import '../../../common_widgets/product/product_card.dart';
import '../../../domain/entities/category/category_response_entity.dart';
import '../../bloc/category_bloc/category_bloc.dart';
import '../../bloc/product_bloc/product_bloc.dart';

class CategoryPage extends StatefulWidget {
  final Category category;
  const CategoryPage({
    super.key,
    required this.category,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController searchController = TextEditingController();

  void CategoryPage(String catId) {
    context.read<ProductBloc>().add(GetCategoryProductEvent(id: catId));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryPage(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus(); // Unfocus text field
        },
        child: SafeArea(
            child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            CustomAppBar(
              title: widget.category.name,
              needBack: true,
            ),
            SizedBox(
              height: media.height / 70,
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                switch (state.subCategoryStatus) {
                  case SubCategoryStatus.initial:
                  case SubCategoryStatus.loading:
                    return const Center(child: ProductShimmer());

                  case SubCategoryStatus.error:
                    return Center(child: Text(state.errorMsg!));

                  case SubCategoryStatus.loaded:
                    final subCategories = state.subCategory?.subcategory ?? [];

                    // Filter according to widget.category.id (instead of Obx)
                    final filteredSubCategories = subCategories
                        .where((subCat) => subCat.category
                            .any((cat) => cat.id == widget.category.id))
                        .toList();

                    if (filteredSubCategories.isEmpty) {
                      return Container(); // Return empty if no match
                    }

                    // 👇 You can switch between horizontal scroll OR Wrap based on your design
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: filteredSubCategories.map((item) {
                          return GestureDetector(
                            onTap: () {
                              // Get.to(() => SubCategoryPage(
                              //     category: widget.category, subCategory: item));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    width: 2, color: AppLightColor.primary),
                              ),
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                }
              },
            ),
            SizedBox(
              height: media.height / 70,
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              switch (state.categoryProductStatus) {
                case CategoryProductStatus.initial:
                case CategoryProductStatus.loading:
                  return const Center(child: ProductShimmer());
                case CategoryProductStatus.error:
                  return Center(child: Text(state.errorMsg!));
                case CategoryProductStatus.loaded:
                  final products = state.categoryProducts!.product;
                  return Wrap(
                    spacing: media.width / 30,
                    runSpacing: media.height / 50,
                    alignment: WrapAlignment.center,
                    children: products.map((product) {
                      return SizedBox(
                        width: media.width / 2.2,
                        child: ProductCard(product: product),
                      );
                    }).toList(),
                  );
              }
            }),
          ],
        )),
      ),
    );
  }
}
