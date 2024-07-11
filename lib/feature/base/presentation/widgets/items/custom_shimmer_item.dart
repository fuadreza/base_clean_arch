import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    required this.height,
    required this.width,
    this.radius = 0.0,
  });
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white10,
      baseColor: ColorConstants.shadowCardColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorConstants.headerTable,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
