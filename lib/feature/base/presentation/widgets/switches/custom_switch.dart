import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    this.value = false,
    this.scale = 0.8,
    this.onChanged,
  });
  final bool value;
  final double scale;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _switchValue = false;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.scale,
      transformHitTests: true,
      child: CupertinoSwitch(
        value: _switchValue,
        activeColor: ColorConstants.primary,
        onChanged: (value) {
          setState(() {
            _switchValue = !_switchValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
