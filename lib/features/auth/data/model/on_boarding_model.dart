import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;
  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
      imagePath: AppAssets.onBoardingOne,
      title: AppStrings.onBoardingTitleOne,
      subTitle: AppStrings.onBoardingSubTitleOne,
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoardingTwo,
      title: AppStrings.onBoardingTitleTwo,
      subTitle: AppStrings.onBoardingSubTitleTwo,
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoardingThree,
      title: AppStrings.onBoardingTitleThree,
      subTitle: AppStrings.onBoardingSubTitleThree,
    ),
  ];
}
