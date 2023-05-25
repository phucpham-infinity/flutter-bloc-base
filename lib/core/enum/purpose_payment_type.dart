import 'package:pine_app/feature/app.dart';
import 'package:pine_app/generated/l10n.dart';

enum PurposePaymentType { purposePayment }

extension PurposePaymentTypeExtension on PurposePaymentType {
  String get displayName {
    if (this == PurposePaymentType.purposePayment) {
      return S.current.purposePayment;
    }

    return '';
  }
}

PurposePaymentType? fromStringToPurposePaymentType(String status) {
  return PurposePaymentType.values
      .firstWhereOrNull((element) => element.name == status);
}
