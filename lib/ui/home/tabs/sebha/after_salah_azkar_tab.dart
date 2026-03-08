import 'package:flutter/material.dart';
import 'package:islami_c18/model/zikr.dart';
import 'package:islami_c18/ui/home/tabs/sebha/widgets/azkar_completed_view.dart';
import 'package:islami_c18/ui/home/tabs/sebha/widgets/sebha.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class AfterSalahAzkarTab extends StatefulWidget {
  const AfterSalahAzkarTab({super.key});

  @override
  State<AfterSalahAzkarTab> createState() => _AfterSalahAzkarTabState();
}

final List<Zikr> azkar = Zikr.azkarList();

class _AfterSalahAzkarTabState extends State<AfterSalahAzkarTab> {
  int currentZikrIndex = 0;
  int currentZikrCount = 0;
  bool isCycleCompleted = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.bgAzkar),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: Column(
              spacing: 8,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManager.islamiHeader,
                    width: screenWidth * 0.75,
                  ),
                ),

                Visibility(
                  visible: !isCycleCompleted,
                  replacement: AzkarCompletedView(
                    onNext: () {
                      setState(() {
                        currentZikrCount = 0;
                        currentZikrIndex = 0;
                        isCycleCompleted = false;
                      });
                    },
                  ),
                  child: Column(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        azkar[currentZikrIndex].aya,
                        style: AppStyles.bold20White.copyWith(fontSize: 36),
                        textAlign: TextAlign.center,
                      ),
                      Sebha(
                        currentZikr: azkar[currentZikrIndex].name,
                        count: currentZikrCount,
                        onTap: () {
                          plusZikr();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void plusZikr() {
    setState(() {
      if (currentZikrCount > 31) {
        if (currentZikrIndex == azkar.length - 1) isCycleCompleted = true;
        currentZikrCount = 0;
        currentZikrIndex = (currentZikrIndex + 1) % azkar.length;
      } else {
        currentZikrCount++;
      }
    });
  }
}
