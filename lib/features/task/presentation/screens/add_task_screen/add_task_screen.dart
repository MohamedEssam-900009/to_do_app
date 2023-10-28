import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  int currentIndex = 0;

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
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! Title
                AddTaskComponent(
                  title: AppStrings.title,
                  hintText: AppStrings.titleHint,
                  controller: titleController,
                ),
                SizedBox(height: 24.0.h),
                //! Note
                AddTaskComponent(
                  title: AppStrings.note,
                  hintText: AppStrings.noteHint,
                  controller: noteController,
                ),
                SizedBox(height: 24.0.h),
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
                SizedBox(height: 24.0.h),
                //! Start Time
                Row(
                  children: [
                    Expanded(
                      child: AddTaskComponent(
                        readOnly: true,
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
                    SizedBox(width: 27.0.w),
                    //! End Time
                    Expanded(
                      child: AddTaskComponent(
                        readOnly: true,
                        title: AppStrings.endTime,
                        hintText: endTime,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? pickEndTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(currentDate),
                            );
                            if (pickEndTime != null) {
                              setState(() {
                                endTime = pickEndTime.format(context);
                              });
                            } else {
                              print('End Time == Null');
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
                SizedBox(height: 24.0.h),
                SizedBox(
                  height: 68.0.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Color
                      Text(
                        AppStrings.color,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(height: 8.0.h),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 12.0.w),
                          itemBuilder: (context, index) {
                            Color getColor(index) {
                              switch (index) {
                                case 0:
                                  return AppColors.red;
                                case 1:
                                  return AppColors.green;
                                case 2:
                                  return AppColors.blueGrey;
                                case 3:
                                  return AppColors.blue;
                                case 4:
                                  return AppColors.orange;
                                case 5:
                                  return AppColors.purple;
                                default:
                                  return AppColors.grey;
                              }
                            }

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: getColor(index),
                                child: index == currentIndex
                                    ? const Icon(Icons.check)
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //! Add Task Button
                SizedBox(height: 92.0.h),
                SizedBox(
                  height: 48.0.h,
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
      ),
    );
  }
}
