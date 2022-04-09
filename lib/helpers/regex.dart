class RegexHelper {
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  String removeTrailingZero(String text) {
    return text.toString().replaceAll(regex, '');
  }
}
