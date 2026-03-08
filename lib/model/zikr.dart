
import '../core/resources/strings_manager.dart';

class Zikr {
  final String name;
  final String aya;

  const Zikr({required this.name, required this.aya});

  static List<Zikr> azkarList() => const [
    Zikr(
      name: StringsManager.tabAzkarSubhanAllah,
      aya: StringsManager.tabAzkarSubhanAllahAya,
    ),
    Zikr(
      name: StringsManager.tabAzkarAlhamdulillah,
      aya: StringsManager.tabAzkarAlhamdulillahAya,
    ),
    Zikr(
      name: StringsManager.tabAzkarAllahAkbar,
      aya: StringsManager.tabAzkarAllahAkbarAya,
    ),
  ];
}
