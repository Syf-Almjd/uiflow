import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../config/utils/styles/app_colors.dart';

/// Widget for displaying items in a list with optional click handling.
Widget itemsList({
  String? name,
  String? img,
}) {
  bool isClicked = false;
  return GestureDetector(
    child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white38,
          border: Border.all(
              color: isClicked == false
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                img!,
                fit: BoxFit.contain,
                scale: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name!,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )),
  );
}

/// Widget for displaying items in a row with optional onTap callback.
Widget rowHomeItems({
  required String name,
  required String img,
  required Function onTap,
}) {
  return InkWell(
    onTap: () {
      onTap(name);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: 150,
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        img,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress != null
                              ? Center(
                                  child: LoadingAnimationWidget.flickr(
                                      leftDotColor: Colors.blue,
                                      rightDotColor: Colors.yellow,
                                      size: 30))
                              : child;
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(name),
            ],
          ),
        ),
      ),
    ),
  );
}

/// Widget for displaying social media items with onTap callback.
Widget socialMediaItem({
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
                  ? Center(
                      child: LoadingAnimationWidget.flickr(
                          leftDotColor: AppColors.primaryColor,
                          rightDotColor: AppColors.greenColor,
                          size: 30))
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

/// Widget for displaying items in a column with photo, price, name, and description.
Widget columnHomeItems({
  required String itemPhotoLink,
  required String itemPrice,
  required String itemName,
  required String itemDescription,
}) {
  return Column(
    children: [
      SizedBox(
        height: 100,
        width: double.maxFinite,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              itemPhotoLink,
              fit: BoxFit.cover,
            )),
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        children: [
          Text(
            "$itemPrice \$",
            style: const TextStyle(fontSize: 10, color: Colors.green),
          ),
          const Spacer(),
          Text(
            itemName,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      Text(
        itemDescription,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 10),
      ),
      const SizedBox(
        height: 10,
        width: 10,
      ),
    ],
  );
}

/// Widget for displaying a simple card with title and icon.
Widget simpleCard({
  required String title,
  required IconData icon,
}) {
  return Card(
    margin: const EdgeInsets.all(10),
    elevation: 1,
    color: Colors.transparent,
    borderOnForeground: false,
    child: ListTile(
        splashColor: Colors.transparent,
        tileColor: Colors.transparent,
        title: Text(
          title,
          style: const TextStyle(color: AppColors.darkColor),
        ),
        leading: Icon(icon)),
  );
}
