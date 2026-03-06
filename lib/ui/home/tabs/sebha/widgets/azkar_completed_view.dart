import 'package:flutter/material.dart';
import 'package:islami_c18/core/resources/assets_manager.dart';
import 'package:islami_c18/core/resources/colors_manager.dart';
import 'package:islami_c18/core/resources/strings_manager.dart';
import 'package:islami_c18/core/resources/styles_manager.dart';
import 'package:lottie/lottie.dart';

class AzkarCompletedView extends StatelessWidget {
  final VoidCallback onNext;

  const AzkarCompletedView({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24,
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: Lottie.asset(AssetsManager.imgCompletedSuccessfully),
        ),
        Text(
          StringsManager.azkarCompletedViewDesc,
          style: AppStyles.bold20White.copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        Text(
          StringsManager.azkarCompletedViewTitle,
          style: AppStyles.bold20White.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.gold,
              foregroundColor: ColorsManager.black,
              elevation: 0,
            ),
            child: Text(
              StringsManager.nextSalahAzkar,
              style: AppStyles.bold20White.copyWith(color: ColorsManager.black),
            ),
          ),
        ),
      ],
    );
  }
}
