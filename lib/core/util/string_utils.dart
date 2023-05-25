import 'dart:io';
import 'package:path/path.dart';

const userNameCharacterPattern = r'[a-zA-Z0-9_\p{L}]+$';
final hashTagRegExp = RegExp(r"\B#[a-zA-Z0-9]+\b");
final userTagRegExp = RegExp(r"\B@[a-zA-Z0-9+]+\b");
final RegExp postcodeRegex = RegExp(r"^[a-z]{1,2}\d[a-z\d]?\s*\d[a-z]{2}",
    caseSensitive: false, multiLine: false);

final RegExp spaceRegex = RegExp(r"\s+");

extension StringValidator on String {
  /// Returns [postcode] if is valid, value boolean.
  bool isValidPostcode() => postcodeRegex.hasMatch(this);

  bool isValidEmail() {
    final RegExp emailExp = RegExp(r'^[\w-\.+]+@([\w-]+\.)+[\w-]{2,6}$');
    return emailExp.hasMatch(this);
  }

  bool isOnlyAlphabet() {
    final RegExp alphabetOnRegExp = RegExp('[a-zA-Z]');

    return alphabetOnRegExp.hasMatch(this);
  }

  bool isOnlyNumber(String? value) {
    final RegExp numbersOnly = RegExp(r'[0-9]');
    return numbersOnly.hasMatch(this);
  }

  bool isValidPassword() {
    final RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool isValidName() {
    const namePattern = r'^[a-zA-Z-_ ]+$';
    return RegExp(namePattern).hasMatch(this);
  }

  bool isValidUserName() {
    return RegExp(userNameCharacterPattern).hasMatch(this);
  }

  bool isImageLink() {
    const pattern = r'(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)';
    return RegExp(pattern).hasMatch(this);
  }

  bool isPassword() {
    final RegExp passwordExp = RegExp(r'^[\S]+.*[\S]+$');
    return passwordExp.hasMatch(this);
  }

  String removeFirstZero() {
    return replaceFirst(RegExp('^0+'), '');
  }
}

extension StringUtil on String {
  String getMaxLengthString(int maxLength) {
    if (maxLength < 1) return '';
    if (length > maxLength) {
      return '${substring(0, maxLength - 1)}...';
    }
    return this;
  }

  String firstLetterEachWord({int maxCount = 2}) {
    final list = this.split(' ')..removeWhere((str) => str == '');
    return list.map((e) => e[0]).take(maxCount).join();
  }

  num currencyToNum() {
    return num.tryParse(replaceAll(',', '').replaceAll('\$', '')) ?? 0;
  }

  String getShortString(int length) {
    String name = basename(this);
    if (name.length > length) {
      name =
          '${name.substring(0, (length / 2).round())}...${name.substring(name.length - (length / 2).round())}';
    }
    return name;
  }

  String getFileSize(File file) {
    final size = file.lengthSync();
    if (size > 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else if (size > 1024) {
      return '${(size / 1024).toStringAsFixed(2)} KB';
    } else {
      return '${size} B';
    }
  }
}

extension StringGraphql on String? {
  String toGraphqlValue() {
    if (this != null) return '"$this"';
    return '""';
  }

  String toBEString() {
    return this?.replaceAll("\n", "\\n").replaceAll("'", "\\\\'") ?? "";
  }

  String toAppString() {
    return this?.replaceAll('\\\\', '').replaceAll("\\'", "'") ?? "";
  }
}
