import 'package:multifunction_calculator/constants.dart';

int parseNumber(String type, String number) {
  int radix = getRadix(type);
  return int.tryParse(number, radix: radix);
}

int getRadix(String type) {
  if (type == Constants.type2) {
    return 2;
  } else if (type == Constants.type8) {
    return 8;
  } else if (type == Constants.type16) {
    return 16;
  } else {
    return 10;
  }
}

String getTypeName(String type) {
  if (type == Constants.type2) {
    return "二进制";
  } else if (type == Constants.type8) {
    return "八进制";
  } else if (type == Constants.type16) {
    return "十六进制";
  } else {
    return "十进制";
  }
}
