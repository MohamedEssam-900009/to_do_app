import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      home: Scaffold(
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
