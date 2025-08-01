import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingWidget({Key? key, required this.isLoading, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child, // Main UI content
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5), // Background overlay
            child: const Center(
              child: CircularProgressIndicator(), // Loading indicator
            ),
          ),
      ],
    );
  }
}
