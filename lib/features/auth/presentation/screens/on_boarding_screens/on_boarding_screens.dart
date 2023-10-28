import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/core/widgets/custom_text_button.dart';
import 'package:to_do_app/features/auth/data/model/on_boarding_model.dart';
import 'package:to_do_app/features/task/presentation/screens/home_screen/home_screen.dart';

// ignore: must_be_immutable
class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextButton(
                      text: index != 2 ? AppStrings.skip : '',
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                    ),
                  ),
                  SizedBox(height: 16.0.h),
                  Image.asset(
                      OnBoardingModel.onBoardingScreens[index].imagePath),
                  SizedBox(height: 16.0.h),
                  SmoothPageIndicator(
                    controller: controller,
                    count: OnBoardingModel.onBoardingScreens.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotHeight: 10.0.h,
                      spacing: 8.0,
                    ),
                  ),
                  SizedBox(height: 52.0.h),
                  Text(
                    OnBoardingModel.onBoardingScreens[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 42.0.h),
                  Text(
                    OnBoardingModel.onBoardingScreens[index].subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 50.0.h),
                  Row(
                    children: [
                      index != 0
                          ? CustomTextButton(
                              text: AppStrings.back,
                              onPressed: () {
                                controller.previousPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                            )
                          : Container(),
                      const Spacer(),
                      index != 2
                          ? CustomButton(
                              text: AppStrings.next,
                              onPressed: () {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                            )
                          : CustomButton(
                              text: AppStrings.getStarted,
                              onPressed: () async {
                                await serviceLocator<CacheHelper>()
                                    .saveData(
                                  key: AppStrings.onBoardingKey,
                                  value: true,
                                )
                                    .then((value) {
                                  navigateTo(
                                    context: context,
                                    screen: const HomeScreen(),
                                  );
                                }).catchError((e) {});
                              },
                            ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
