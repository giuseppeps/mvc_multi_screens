import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('SoccerPulse', style: titleText18),
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: darkColor,
      actions: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.notifications_outlined, color: darkColor),
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.person, color: darkColor),
          ),
        ),
      ],
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
