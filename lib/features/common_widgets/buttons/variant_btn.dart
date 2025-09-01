import 'package:flutter/material.dart';
import 'package:thilagas_recipe/features/domain/entities/variant/variant_entity.dart';

class VariantBtn extends StatelessWidget {
  final Variant variant;
  final VoidCallback onTap;
  final bool isSelected;

  const VariantBtn({
    super.key,
    required this.variant,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isDarkTheme ? const Color(0xFF232323) : Colors.grey[400],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.green
                : Colors.transparent, // ✅ border toggle
            width: 2,
          ),
        ),
        child: Text(
          variant.name,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
