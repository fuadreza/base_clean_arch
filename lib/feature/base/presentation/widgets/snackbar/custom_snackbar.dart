import 'dart:async';

import 'package:base_clean_arch/core/configs/routes/routes.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackbarPosition { top, bottom }

class NewCustomSnackBar {
  static OverlayEntry? _currentEntry;
  static Timer? _timer;

  static void show({
    required String text,
    SnackbarPosition position = SnackbarPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Color color = const Color(0xFF323232),
    Color textColor = Colors.white,
    Widget? icon,
    double horizontalPadding = 16,
    Widget? actionButton,
    double? maxWidth,
    int maxLines = 2,
    bool autoClose = true,
  }) {
    _dismiss();

    final overlay = AppNavigator.navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    _currentEntry = OverlayEntry(
      builder: (context) => _NewCustomSnackBarWidget(
        message: text,
        position: position,
        backgroundColor: color,
        textColor: textColor,
        icon: icon,
        horizontalPadding: horizontalPadding,
        actionButton: actionButton,
        maxWidth: maxWidth,
        maxLines: maxLines,
        autoClose: autoClose,
        onDismiss: _dismiss,
      ),
    );

    overlay.insert(_currentEntry!);
    _timer = Timer(duration, _dismiss);
  }

  static void _dismiss() {
    _timer?.cancel();
    _timer = null;
    _currentEntry?.remove();
    _currentEntry = null;
  }
}

class _NewCustomSnackBarWidget extends StatefulWidget {
  final String message;
  final SnackbarPosition position;
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;
  final Widget? actionButton;
  final double horizontalPadding;
  final double? maxWidth;
  final int maxLines;
  final bool autoClose;
  final VoidCallback onDismiss;

  const _NewCustomSnackBarWidget({
    required this.message,
    required this.position,
    required this.backgroundColor,
    required this.textColor,
    required this.horizontalPadding,
    required this.maxLines,
    required this.autoClose,
    required this.onDismiss,
    this.maxWidth,
    this.icon,
    this.actionButton,
  });

  @override
  State<_NewCustomSnackBarWidget> createState() => _NewCustomSnackBarWidgetState();
}

class _NewCustomSnackBarWidgetState extends State<_NewCustomSnackBarWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool get _isTop => widget.position == SnackbarPosition.top;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    // Slide from top if position is top, from bottom if position is bottom
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, _isTop ? -1 : 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final safeArea = MediaQuery.of(context).padding;

    // Effective max: use explicit maxWidth if given, otherwise screen minus padding
    final effectiveMax = widget.maxWidth ?? (screenWidth - widget.horizontalPadding * 2);

    return _isTop ? _buildTop(effectiveMax, safeArea) : _buildBottom(effectiveMax, safeArea);
  }

  /// TOP — wraps content, centered, never wider than effectiveMax.
  Widget _buildTop(double effectiveMax, EdgeInsets safeArea) {
    return Positioned(
      top: safeArea.top + 12,
      left: widget.horizontalPadding,
      right: widget.horizontalPadding,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Align(
            alignment: Alignment.topCenter,
            child: IntrinsicWidth(
              stepWidth: 1,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: effectiveMax),
                child: _buildContent(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// BOTTOM — full width by default; capped at effectiveMax when maxWidth is set.
  Widget _buildBottom(double effectiveMax, EdgeInsets safeArea) {
    return Positioned(
      bottom: safeArea.bottom + 16,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: effectiveMax),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
                child: _buildContent(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildContent() {
  //   return Material(
  //     color: Colors.transparent,
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //       decoration: BoxDecoration(
  //         color: widget.backgroundColor,
  //         borderRadius: BorderRadius.circular(8),
  //         boxShadow: const [
  //           BoxShadow(
  //             color: Colors.black26,
  //             blurRadius: 10,
  //             offset: Offset(0, 4),
  //           ),
  //         ],
  //       ),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min, // wraps for top, ignored for bottom full-width
  //         children: [
  //           if (widget.icon != null) ...[
  //             widget.icon!,
  //             const SizedBox(width: 8),
  //           ],
  //           Flexible(
  //             child: Text(
  //               widget.message,
  //               style: TextStyle(color: widget.textColor, fontSize: 14),
  //             ),
  //           ),
  //           const SizedBox(width: 8),
  //           widget.actionButton ?? GestureDetector(
  //             onTap: widget.onDismiss,
  //             child: Icon(Icons.close, color: widget.textColor, size: 18),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget _buildContent() {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              widget.icon!,
              const SizedBox(width: 10),
            ],
            Flexible(
              child: CustomText(
                text: widget.message,
                color: widget.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                maxLines: widget.maxLines,
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: widget.onDismiss,
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Icon(Icons.close, color: widget.textColor, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}