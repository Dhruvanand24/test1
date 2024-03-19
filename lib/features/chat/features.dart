import 'package:flutter/material.dart';
import 'package:test1/design/app_colors.dart';

class Features extends StatelessWidget {
  const Features({
    super.key,
    required this.Description,
  });
  final String Description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 88.0, vertical: 20),
        alignment: Alignment.center,
        child: Text(
          Description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor,
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.messageBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
