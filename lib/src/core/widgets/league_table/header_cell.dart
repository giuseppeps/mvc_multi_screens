import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';

class HeaderCell extends StatelessWidget {
  final String label;
  final TextAlign textAlign;

  const HeaderCell({
    super.key,
    required this.label,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: tableBorderColor, width: 1)),
      ),
      child: Text(
        label,
        style: titleText14.copyWith(
          fontWeight: FontWeight.bold,
          color: darkColor,
        ),
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
