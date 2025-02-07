extension StringExtension on String {
  String get capitalized => this[0].toUpperCase() + substring(1);

  String ifEmpty(String text) => isEmpty ? text : this;

  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    int split = (maxLength - 3) ~/ 2;
    return '${substring(0, split)}...${substring(length - split)}';
  }
}
