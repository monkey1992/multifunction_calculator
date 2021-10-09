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

String getIllegalTip(String type) {
  if (type == Constants.type2) {
    return "请输入合法的二进制数，二进制数每一位只能输入0或1";
  } else if (type == Constants.type8) {
    return "请输入合法的八进制数，八进制数每一位只能输入0到7范围内的数字";
  } else if (type == Constants.type16) {
    return "请输入合法的十六进制数，十六进制数每一位只能输入0到9范围内的数字和a到f范围内的字母";
  } else {
    return "请输入合法的十进制数，十进制数每一位只能输入0到9范围内的数字";
  }
}
