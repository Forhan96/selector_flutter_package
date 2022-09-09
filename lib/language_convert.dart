import 'package:selection_dialogs/utils/general_const.dart';

class LanguageConvert {
  String nameToCode(String name) {
    String isoCode = "";
    getModelItems().forEach((element) {
      if (element.name == name) {
        isoCode = element.locale.toString();
      }
    });
    return isoCode;
  }

  String codeToName(String code) {
    String name = "";
    getModelItems().forEach((element) {
      if (element.locale.toString() == code) {
        name = element.name;
      }
    });
    return name;
  }
}
