enum OperatorEnum {
  none,
  equal,
  multiplication,
  subtraction,
  addition,
  division,
}

extension OperatorX on OperatorEnum {
  String get toUIString {
    switch (this) {
      case OperatorEnum.equal:
        return "=";
      case OperatorEnum.multiplication:
        return "*";
      case OperatorEnum.subtraction:
        return "-";
      case OperatorEnum.addition:
        return "+";
      case OperatorEnum.division:
        return "/";
      default:
        return "-";
    }
  }
}
