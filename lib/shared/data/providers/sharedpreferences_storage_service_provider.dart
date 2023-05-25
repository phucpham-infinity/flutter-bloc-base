import '../local/shared_prefs_storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storageServiceProvider = Provider((ref) {
  final SharedPrefsService prefsService = SharedPrefsService();
  prefsService.init();
  return prefsService;
});
