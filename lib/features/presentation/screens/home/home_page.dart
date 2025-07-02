import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/category_bloc/category_bloc.dart';
import 'widgets/category/category_loader.dart';
import 'widgets/category/category_widget.dart';
import 'widgets/headings/topic_line.dart';
import 'widgets/offers/offer_loader.dart';
import '../../bloc/offer_bloc/offer_bloc.dart';
import 'widgets/fields/search_field.dart';
import 'widgets/offers/offer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _fetchDatas() {
    BlocProvider.of<OfferBloc>(context).add(GetOfferEvent());
    BlocProvider.of<CategoryBloc>(context).add(GetCategoryEvent());
  }

  @override
  void initState() {
    _fetchDatas();
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
                Container(
                    width: media.width / 3,
                    child: isDarkTheme
                        ? Image.asset("assets/images/dark_logo.png")
                        : Image.asset("assets/images/logo.png")),
                SearchField(
                  onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
