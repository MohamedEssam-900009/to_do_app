import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        centerTitle: false,
        title: Text(
          AppStrings.addTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: AppStrings.titleHint,
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                AppStrings.note,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: noteController,
                decoration: const InputDecoration(
                  hintText: AppStrings.noteHint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
