import 'package:flutter/material.dart';
import 'package:todo_list/core/color.dart';
import 'package:todo_list/core/size.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.left, this.right, this.color});

  final Widget left;
  final Widget? right;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRounded),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              left,
              if (right != null) right!,
            ],
          ),
        ),
      ),
    );
  }
}
