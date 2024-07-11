import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardBackgroundContainer extends StatelessWidget {
  const CardBackgroundContainer({super.key, required this.body, this.flexible = 1});
  final Widget? body;
  final int flexible;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexible,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        margin: EdgeInsets.all(12.r),
        child: body,
      ),
    );
  }
}
