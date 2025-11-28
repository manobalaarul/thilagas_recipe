import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:thilagas_recipe/features/presentation/screens/home/widgets/product/product_loader.dart';
import 'package:thilagas_recipe/features/presentation/screens/search/search_page.dart';

import '../../../common_widgets/headlines/topicline.dart';
import '../../bloc/category_bloc/category_bloc.dart';
import '../../bloc/offer_bloc/offer_bloc.dart';
import '../../bloc/product_bloc/product_bloc.dart';
import 'widgets/category/category_loader.dart';
import 'widgets/category/category_widget.dart';
import 'widgets/fields/search_field.dart';
import 'widgets/offers/offer_loader.dart';
import 'widgets/offers/offer_widget.dart';
import 'widgets/product/new_arrivals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: media.width / 3,
                    child: isDarkTheme
                        ? Image.asset("assets/images/dark_logo.png")
                        : Image.asset("assets/images/logo.png")),
                SearchField(
                  onTap: () {
                    Get.to(const SearchPage());
                  },
                  readOnly: true,
                  hintText: 'Search',
                ),
              ],
            ),
            SizedBox(
              height: media.height * 0.01,
            ),
            BlocBuilder<OfferBloc, OfferState>(builder: (context, state) {
              switch (state.status) {
                case OfferStatus.initial:
                case OfferStatus.loading:
                  return const Center(child: OfferLoader());
                case OfferStatus.error:
                  return Center(child: Text(state.errorMsg!));
                case OfferStatus.loaded:
                  final offers = state.offer;
                  return OfferWidget(offers: offers!);
              }
            }),
            SizedBox(
              height: media.height * 0.01,
            ),
            TopicLine(
              title: "Categories",
              onTap: () {},
            ),
            SizedBox(
              height: media.height * 0.01,
            ),
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
              switch (state.status) {
                case CategoryStatus.initial:
                case CategoryStatus.loading:
                  return const Center(child: CategoryLoader());
                case CategoryStatus.error:
                  return Center(child: Text(state.errorMsg!));
                case CategoryStatus.loaded:
                  final category = state.category!.category;
                  return CategoryWidget(category: category);
              }
            }),
            SizedBox(
              height: media.height * 0.01,
            ),
            TopicLine(
              title: "New Arrivals",
              onTap: () {},
            ),
            SizedBox(
              height: media.height * 0.01,
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              switch (state.status) {
                case ProductStatus.initial:
                case ProductStatus.loading:
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.all(3),
                        child: const ProductLoader()),
                  );
                case ProductStatus.error:
                  return Center(child: Text(state.errorMsg!));
                case ProductStatus.loaded:
                  final products = state.products!.product;
                  return NewArrivals(products: products);
              }
            }),
          ],
        ),
      ),
    );
  }
}
