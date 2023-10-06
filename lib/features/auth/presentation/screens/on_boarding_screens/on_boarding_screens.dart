import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

// ignore: must_be_immutable
class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.skip,
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: AppColors.white.withOpacity(.44),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Image.asset(AppAssets.onBoardingOne),
                        const SizedBox(height: 16.0),
                        //Dots
                        SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.primary,
                            dotHeight: 10.0,
                            spacing: 8.0,
                          ),
                        ),
                        const SizedBox(height: 52.0),
                        Text(
                          AppStrings.onBoardingTitleOne,
                          style: GoogleFonts.lato(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 42.0),
                        Text(
                          AppStrings.onBoardingSubTitleOne,
                          style: GoogleFonts.lato(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 50.0),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.back,
                      style: GoogleFonts.lato(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withOpacity(.44),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: Text(
                      AppStrings.next,
                      style: GoogleFonts.lato(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
