import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../config/utils/managers/app_assets.dart';
import '../config/utils/managers/app_enums.dart';
import '../config/utils/styles/app_colors.dart';

/// Returns a loading animation widget.
///
/// Parameters:
/// - [loadingType]: Widget representing the loading animation type.
Widget loadingAnimation({Widget? loadingType}) {
  if (loadingType != null) {
    return loadingType;
  } else {
    return Center(
        child: LoadingAnimationWidget.waveDots(
            color: AppColors.primaryColor, size: 30));
  }
}

/// Returns a skeleton loading widget based on the specified [type].
///
/// Parameters:
/// - [type]: The type of posts for which the skeleton loading is generated.
Widget getSkeletonLoading({required PostsType type}) {
  return Wrap(
    runSpacing: 50,
    children: List.generate(10, (index) {
      return type == PostsType.largePost
          ? Image.asset(AppAssets.appLargePostLoading)
          : Image.asset(AppAssets.appSmallPostLoading);
    }),
  );
}
