import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/auth/data/model/on_boarding_model.dart';
import 'package:to_do_app/features/task/presentation/screens/home_screen.dart';

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
                    child: TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: index != 2
                          ? Text(
                              AppStrings.skip,
                              style: Theme.of(context).textTheme.displaySmall,
                            )
                          : const SizedBox(height: 16.0),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Image.asset(
                      OnBoardingModel.onBoardingScreens[index].imagePath),
                  const SizedBox(height: 16.0),
                  SmoothPageIndicator(
                    controller: controller,
                    count: OnBoardingModel.onBoardingScreens.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotHeight: 10.0,
                      spacing: 8.0,
                    ),
                  ),
                  const SizedBox(height: 52.0),
                  Text(
                    OnBoardingModel.onBoardingScreens[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 42.0),
                  Text(
                    OnBoardingModel.onBoardingScreens[index].subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    children: [
                      index != 0
                          ? TextButton(
                              onPressed: () {
                                controller.previousPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                              child: Text(
                                AppStrings.back,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            )
                          : Container(),
                      const Spacer(),
                      index != 2
                          ? ElevatedButton(
                              onPressed: () {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              child: Text(
                                AppStrings.next,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                //Navigate to home screen
                                await serviceLocator<CacheHelper>().saveData(
                                  key: AppStrings.onBoardingKey,
                                  value: true,
                                )
                                    .then((value) {
                                  log('onBoarding Visited');
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeScreen(),
                                    ),
                                  );
                                }).catchError((e) {
                                  log(e.toString());
                                });
                              },
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              child: Text(
                                AppStrings.getStarted,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
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
