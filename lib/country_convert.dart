import 'utils/general_const.dart';

class CountryConvert {
  String nameToCode(String name) {
    String isoCode = "";
    for (var element in countryList) {
      if (element.name == name) {
        isoCode = element.isoCode;
      }
    }
    return isoCode;
  }

  String codeToName(String isoCode) {
    String name = "";
    for (var element in countryList) {
      if (element.isoCode == isoCode) {
        name = element.name;
      }
    }
    return name;
  }
}
