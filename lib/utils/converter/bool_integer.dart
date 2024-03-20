class BoolConverter {
  BoolConverter._();

  ///
  /// Function return [bool] converted from type int
  ///
  static bool boolFromInt(int value) {
    int result = value.clamp(0, 1);
    return result == 0;
  }

  /// Function return [int] converted from type Bool
  ///
  static int integerFromBool(bool value) {
    if (value == true) {
      return 1;
    } else {
      return 0;
    }
  }
}
