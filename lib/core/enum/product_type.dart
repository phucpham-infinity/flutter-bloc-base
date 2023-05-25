import 'package:pine_app/feature/app.dart';
import 'package:pine_app/generated/l10n.dart';

enum ProductType { openAccount, changeRate, newService }

extension ProductTypeExtension on ProductType {
  String get displayName {
    if (this == ProductType.openAccount) {
      return S.current.openAccount;
    }
    if (this == ProductType.changeRate) {
      return S.current.changeRate;
    }
    if (this == ProductType.newService) {
      return S.current.newService;
    }
    return '';
  }
}

ProductType? fromStringToProductType(String status) {
  return ProductType.values
      .firstWhereOrNull((element) => element.name == status);
}
