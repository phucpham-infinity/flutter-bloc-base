# Base APP

A new Flutter project.

## Work with github

## Getting Started with the code

### 1. How to navigate to new screen

- Use the `navigateTo` method.

```
navigateTo(YourScreen());
```

### 2. Localization

- You have to install the plugin: [Flutter Intl](https://plugins.jetbrains.com/plugin/13666-flutter-intl)
- Declare texts under `lib/l10n/intl_en.arb`. Every time you change the texts under this file and save, above plugin will run automatically to generate new code.
- How to use localized texts:

```
// yourKey is the key you defined in intl_en.arb
Text(S.current.yourKey);
```

- If you want to add new language, just create new .arb file under lib/l10n/ folder. The file name is `intl_{countrycode}.arb`.

### Issue with M1 macs

run

- arch -x86_64 pod update
- arch -x86_64 pod install

### Issue with Intl not generate files

- flutter pub global deactivate intl_utils
- flutter pub global activate intl_utils

### 3. BUILD

All available commands in ./build_command folder

- android_bundle: build for google play alpha/beta test or production, generate build\app\outputs\flutter-apk\appbundle.abb
- android: build for apk file that can be install any android phone, generate build\app\outputs\bundle\release\app-release.aab
- ios: build for testflight, generate build/ios/iphoneos/Runner.app

For size optimize

- android: flutter build apk --release --target-platform android-arm64 --analyze-size
- ios: flutter build ios --release --split-debug-info=

## Tips

1. Use !D/EGL_emulation to filter emulator logs

### Install mock server and run:

- make run_mock_server
