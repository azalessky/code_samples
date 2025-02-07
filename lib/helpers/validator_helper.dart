class TextLengthValidator {
  final String? emptyMessage;
  final int? minLength;
  final int? maxLength;
  final String? minMessage;
  final String? maxMessage;

  const TextLengthValidator({
    this.emptyMessage,
    this.minLength,
    this.maxLength,
    this.minMessage,
    this.maxMessage,
  });

  String? validate(String? text) {
    if (text?.isEmpty == true) return emptyMessage;
    if (minLength != null && text!.length < minLength!) return minMessage;
    if (maxLength != null && text!.length > maxLength!) return maxMessage;
    return null;
  }
}

class TextRequiredValidator {
  final String errorText;

  const TextRequiredValidator([this.errorText = '']);

  String? validate(String? value) {
    return value?.isNotEmpty == true ? null : errorText;
  }
}

class DoubleRequiredValidator {
  final bool allowEmpty;
  final String errorText;

  const DoubleRequiredValidator([this.allowEmpty = false, this.errorText = '']);

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return allowEmpty ? null : errorText;
    }
    if (double.tryParse(value) == null) {
      return errorText;
    }
    return null;
  }
}
