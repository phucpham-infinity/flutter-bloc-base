import 'package:pine_app/feature/app.dart';
import 'package:pine_app/generated/l10n.dart';

enum PayerType { legalEntity, individual }

extension PayerTypeExtension on PayerType {
  String get displayName {
    if (this == PayerType.legalEntity) {
      return S.current.legalEntity;
    }
    if (this == PayerType.individual) {
      return S.current.individual;
    }

    return '';
  }
}

PayerType? fromStringToPayerType(String status) {
  return PayerType.values.firstWhereOrNull((element) => element.name == status);
}
