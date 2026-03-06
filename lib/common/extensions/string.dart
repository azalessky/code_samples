extension StringHelperExtension on String {
  String get capitalized {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  String ifEmpty(String text) => isEmpty ? text : this;

  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    if (maxLength <= 3) return substring(0, maxLength);

    int split = (maxLength - 3) ~/ 2;
    return '${substring(0, split)}...${substring(length - split)}';
  }

  String toSeparated(String separator) {
    if (isEmpty) return '';
    final regex = RegExp(r'(?<=[a-z])(?=[A-Z])');
    return split(regex).join(separator).toLowerCase();
  }
}
