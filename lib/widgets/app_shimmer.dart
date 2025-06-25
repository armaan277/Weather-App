import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(height: 50, width: 50, color: Colors.white),
            const SizedBox(height: 10),
            Container(height: 28, width: 150, color: Colors.white),
            const SizedBox(height: 8),
            Container(height: 18, width: 60, color: Colors.white),
            const SizedBox(height: 10),
            Container(height: 30, width: 50, color: Colors.white),
            const SizedBox(height: 5),
            Container(height: 19, width: 160, color: Colors.white),
            const SizedBox(height: 10),
            Container(height: 45, width: 150, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
