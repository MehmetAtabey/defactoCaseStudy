extension IsNullOrEmptyObject<T extends Object> on T {
  bool isNullOrEmptyObject() {
    var result = ["", "false", "0", "null", false, 0, null].contains(this) ? true : false;
    return result;
  }
}