import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';

class BodyCell extends StatelessWidget {
  final Widget child;
  final TextAlign textAlign;

  const BodyCell({
    super.key,
    required this.child,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: tableBorderColor, width: 1)),
      ),
      child: child,
    );
  }
}
