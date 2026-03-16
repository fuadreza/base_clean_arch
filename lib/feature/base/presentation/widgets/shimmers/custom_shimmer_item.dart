import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    required this.height,
    required this.width,
    this.radius = 0.0,
    this.highlightColor,
    this.baseColor,
  });

  final double height;
  final double width;
  final double radius;
  final Color? highlightColor;
  final Color? baseColor;

  factory CustomShimmer.secondary({
    required double height,
    required double width,
    double radius = 4.0,
  }) {
    return CustomShimmer(
      height: height,
      width: width,
      radius: radius,
      highlightColor: Colors.black12,
      baseColor: Colors.black26,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: highlightColor ?? Colors.white10,
      baseColor: baseColor ?? ColorConstants.shadowCardColor,
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
