import 'package:flutter/material.dart';
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
                    : const SizedBox(height: 50),
                const SizedBox(height: 16),
                Image.asset(OnBoardingModel.onBoardingScreens[index].imgPath),
                const SizedBox(height: 16),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotHeight: 10,
                    spacing: 8,
                  ),
                ),
                const SizedBox(
                  height: 52,
                ),
                Text(
                  OnBoardingModel.onBoardingScreens[index].title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 42),
                Text(
                  OnBoardingModel.onBoardingScreens[index].subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 50),
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
