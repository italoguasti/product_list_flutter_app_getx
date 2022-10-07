extension ExtractNumbersExtension on String {
  String extractNumbers() {
    final String result = this;
    return result.replaceAll(RegExp('[^0-9]'), '');
  }
}
