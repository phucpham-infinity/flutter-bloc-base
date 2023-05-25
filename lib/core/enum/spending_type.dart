import 'package:pine_app/feature/app.dart';
import 'package:pine_app/generated/l10n.dart';

enum SpendingType {
  paymentOfFees,
  paymentForFines,
  paymentOfCounterparties,
  payrollPayments,
  taxesPayment,
}

extension SpendingTypeExtension on SpendingType {
  String get displayName {
    if (this == SpendingType.paymentOfFees) {
      return S.current.paymentOfFees;
    }
    if (this == SpendingType.paymentForFines) {
      return S.current.paymentForFines;
    }
    if (this == SpendingType.paymentOfCounterparties) {
      return S.current.paymentOfCounterparties;
    }
    if (this == SpendingType.payrollPayments) {
      return S.current.payrollPayments;
    }
    if (this == SpendingType.taxesPayment) {
      return S.current.taxesPayment;
    }
    return '';
  }
}

SpendingType? fromStringToSpendingType(String status) {
  return SpendingType.values
      .firstWhereOrNull((element) => element.name == status);
}
