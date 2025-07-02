import 'package:flutter/material.dart';
import '../../../../../domain/entities/category/category_response_entity.dart';
import '../../../../../utils/helper/path_to_url.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // Get.to(() => CategoryProduct(category: category));
      },
      child: Container(
        width: media.width / 4,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(pathToUrl(category.image), fit: BoxFit.cover),
            SizedBox(height: 5),
            Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 2, // Ensure single line
              overflow: TextOverflow.ellipsis, // Add '...' if text is too long
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
