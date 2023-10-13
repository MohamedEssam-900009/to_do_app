import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Text(
              DateTime.now().toString(),
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
