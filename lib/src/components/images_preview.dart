import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uiflow/src/components/reposnsiveness.dart';

import '../config/utils/managers/app_assets.dart';
import '../config/utils/managers/app_constants.dart';
import '../config/utils/styles/app_colors.dart';

/// Returns a padding container with a logo image.
///
/// Parameters:
/// - [context]: Build context.
/// - [appAssetPath]: Path to the app logo asset.
Padding logoContainer(context, String appAssetPath) {
  return Padding(
    padding: const EdgeInsets.all(50.0),
    child: Container(
      width: getWidth(50, context),
      height: getHeight(20, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 2),
      ),
      child: Image(
        image: AssetImage(appAssetPath),
        fit: BoxFit.contain,
      ),
    ),
  );
}

/// Returns a preview of a product image from base64-encoded string.
///
/// Parameters:
/// - [fileUser]: Base64-encoded image string.
/// - [context]: Build context.
Widget previewProductImage(fileUser, context) {
  fileUser = base64Decode(fileUser);
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: Colors.amber),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.memory(
        fileUser,
        height: getHeight(20, context),
        width: getWidth(30, context),
        fit: BoxFit.cover,
      ),
    ),
  );
}

/// Returns a card with product details.
///
/// Parameters:
/// - [name]: Product name.
/// - [img]: Product image URL.
Widget buildProductDetails({String? name, String? img}) {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          child: Image.network(
            img!,
            height: 50.0,
            width: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Returns a social media item widget.
///
/// Parameters:
/// - [index]: Index of the social media item.
/// - [img]: Image URL of the social media item.
/// - [onTap]: Callback function when the item is tapped.
Widget socialMediaItems({
  required int index,
  required String img,
  required Function onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(7.0),
    child: InkWell(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            img,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              return loadingProgress != null
                  ? const Center(child: CircularProgressIndicator())
                  : child;
            },
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    ),
  );
}

/// Returns a preview of a base64-encoded image.
///
/// Parameters:
/// - [padding]: Padding around the image.
/// - [backgroundColor]: Background color of the container.
/// - [photoRadius]: Border radius of the photo.
/// - [fileUser]: Base64-encoded image string.
/// - [editable]: Flag indicating whether the image is editable.
/// - [context]: Build context.
Widget previewBase64Image({
  double padding = 5.0,
  Color backgroundColor = Colors.transparent,
  double photoRadius = 15.0,
  required fileUser,
  bool editable = false,
  required context,
}) {
  if (fileUser == AppConstants.noPhotoUser) {
    fileUser = AppConstants.sampleBase64Image;
  }
  fileUser = base64Decode(fileUser);
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(photoRadius),
              child: Image.memory(
                fileUser,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: editable,
        replacement: Container(),
        child: Positioned(
          bottom: 7,
          right: 7,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black12,
            ),
            child: const Icon(
              Icons.mode_edit_outline_outlined,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    ],
  );
}

/// Returns a container for choosing a file with an edit icon.
///
/// Parameters:
/// - [context]: Build context.
Widget chooseFile(context) {
  return Container(
    decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: const Image(
            image: AssetImage(AppAssets.assetsProfilePictureSample),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 25,
          right: 25,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black12,
            ),
            child: const Icon(
              Icons.mode_edit_outline_outlined,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
