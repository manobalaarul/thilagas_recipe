import 'package:flutter/material.dart';
import '../../../../../domain/entities/category/category_response_entity.dart';

import 'category_card.dart';

class CategoryWidget extends StatelessWidget {
  final List<Category> category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: category
            .map((category) => CategoryCard(category: category))
            .toList(),
      ),
    );
  }
}
