import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
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
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));

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
                      if (pickedDate != null) {
                        currentDate = pickedDate;
                      } else {
                        print('Picked == null');
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              //! Start Time
              Row(
                children: [
                  Expanded(
                    child: AddTaskComponent(
                      title: AppStrings.startTime,
                      hintText: startTime,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? pickedStartTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentDate),
                          );
                          if (pickedStartTime != null) {
                            setState(() {
                              startTime = pickedStartTime.format(context);
                            });
                          } else {
                            print('Start Time == Null');
                          }
                        },
                        icon: const Icon(
                          Icons.timer_outlined,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 27.0),
                  //! End Time
                  Expanded(
                    child: AddTaskComponent(
                      title: AppStrings.endTime,
                      hintText: endTime,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? pickedStartTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentDate),
                          );
                          if (pickedStartTime != null) {
                            setState(() {
                              startTime = pickedStartTime.format(context);
                            });
                          } else {
                            print('Start Time == Null');
                          }
                        },
                        icon: const Icon(
                          Icons.timer_outlined,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //! Color
              const SizedBox(height: 24.0),
              Column(
                children: [
                  Text(
                    AppStrings.color,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              //! Add Task Button
              const Spacer(),
              SizedBox(
                height: 48.0,
                width: double.infinity,
                child: CustomButton(
                  text: AppStrings.createTask,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
