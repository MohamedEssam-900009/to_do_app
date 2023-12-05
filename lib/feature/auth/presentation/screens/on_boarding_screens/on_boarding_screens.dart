import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../task/presentation/screens/home_screen/home_screen.dart';
import '../../../data/model/on_boarding_model.dart';

// ignore: must_be_immutable
class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24),
        child: PageView.builder(
          controller: controller,
          itemCount: OnBoardingModel.onBoardingScreens.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                index != 2
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: CustomTextButton(
                          text: AppStrings.skip,
                          onPressed: () {
                            controller.jumpToPage(2);
                          },
                        ),
                      )
                    : SizedBox(height: 50.0.h),
                SizedBox(height: 16.0.h),
                Image.asset(OnBoardingModel.onBoardingScreens[index].imgPath),
                SizedBox(height: 16.0.h),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotHeight: 10.0.h,
                    spacing: 8,
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
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                          )
                        : CustomButton(
                            text: AppStrings.getStarted,
                            onPressed: () async {
                              await sl<CacheHelper>()
                                  .saveData(
                                      key: AppStrings.onBoardingKey,
                                      value: true)
                                  .then((value) {
                                navigate(
                                  context: context,
                                  screen: const HomeScreen(),
                                );
                              }).catchError((e) {});
                            })
                  ],
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
