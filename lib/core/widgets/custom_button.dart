import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const MaterialStatePropertyAll(AppColors.orange),
          ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
