import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thilagas_recipe/features/domain/entities/category/category_response_entity.dart';
import '../../bloc/product_bloc/product_bloc.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/design/shimmer.dart';
import '../../../common_widgets/product/product_card.dart';

class CategoryPage extends StatefulWidget {
  final Category category;
  const CategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

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
          padding: EdgeInsets.all(10),
          children: [
            CustomAppBar(
              title: widget.category.name,
              needBack: true,
            ),
            SizedBox(
              height: media.height / 70,
            ),
            // Obx(() {
            //   final filteredSubCategories = productController.subCategoryItems
            //       .where((subCat) => subCat.category!.any((cat) =>
            //           cat.id == widget.category.id)) // Simple filtering
            //       .toList();

            //   if (filteredSubCategories.isEmpty) {
            //     return Container(); // Return empty if no matching subcategories
            //   }

            //   return SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: filteredSubCategories.map((item) {
            //         return GestureDetector(
            //           onTap: () {
            //             // Get.to(() => SubCategoryPage(
            //             //     category: widget.category, subCategory: item));
            //           },
            //           child: Container(
            //             padding: EdgeInsets.all(8),
            //             margin: EdgeInsets.only(right: 8),
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 borderRadius: BorderRadius.circular(7),
            //                 border: Border.all(
            //                     width: 2, color: AppLightColor.primary)),
            //             child: Text(
            //               item.name,
            //               style: TextStyle(
            //                   fontSize: 15, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         );
            //       }).toList(),
            //     ),
            //   );
            // }),
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
                    children: products!.map((product) {
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
