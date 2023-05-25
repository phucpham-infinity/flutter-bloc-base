// ignore_for_file: constant_identifier_names

import 'dart:io';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const int PRODUCTS_PER_PAGE = 20;
const String ACCESS_TOKEN_STORAGE_KEY = 'ACCESS_TOKEN';
const String REFRESH_TOKEN_STORAGE_KEY = 'REFRESH_TOKEN';
const String APP_THEME_STORAGE_KEY = 'AppTheme';
