import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/task/components/add_task_component.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  DateTime currentDate = DateTime.now();

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
              //! Title
              AddTaskComponent(
                title: AppStrings.title,
                hintText: AppStrings.titleHint,
                controller: titleController,
              ),
              const SizedBox(height: 24.0),
              //! Note
              AddTaskComponent(
                title: AppStrings.note,
                hintText: AppStrings.noteHint,
                controller: noteController,
              ),
              const SizedBox(height: 24.0),
              //! Date
              AddTaskComponent(
                title: AppStrings.date,
                hintText: DateFormat.yMd().format(currentDate),
                controller: noteController,
                readOnly: true,
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: currentDate,
                      lastDate: DateTime(2025),
                      // initialDatePickerMode: DatePickerMode.day,
                      // initialEntryMode: DatePickerEntryMode.inputOnly,
                    );
                    setState(() {
                      currentDate = pickedDate!;
                    });
                  },
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
