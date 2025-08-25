import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thilagas_recipe/features/presentation/bloc/product_bloc/product_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../common_widgets/appbar/custom_appbar.dart';
import '../../../common_widgets/design/no_data.dart';
import '../../../common_widgets/design/shimmer.dart';
import '../../../common_widgets/product/product_card.dart';
import '../home/widgets/fields/search_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  void searchProduct(String search) async {
    context.read<ProductBloc>().add(GetSearchProductEvent(text: search));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchProduct("");
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
            const CustomAppBar(
              title: 'Search',
              needBack: true,
            ),
            SizedBox(
              height: media.height / 70,
            ),
            SearchField(
              onChanged: (value) {
                if (value != "") {
                  searchProduct(searchController.text);
                }
              },
              controller: searchController,
              hintText: 'Search products',
              readOnly: false,
              right: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: AppLightColor.primary,
                  )),
            ),
            SizedBox(
              height: media.height / 70,
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              switch (state.searchProductStatus) {
                case SearchProductStatus.initial:
                case SearchProductStatus.loading:
                  return const Center(child: ProductShimmer());
                case SearchProductStatus.error:
                  return Center(child: Text(state.errorMsg!));
                case SearchProductStatus.loaded:
                  final products = state.searchProduct!.product;

                  if (products.isEmpty) {
                    return const NoData(data: "No Products available!");
                  }
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
