const String? appFlavor =
    String.fromEnvironment('FLUTTER_APP_FLAVOR') != ''
        ? String.fromEnvironment('FLUTTER_APP_FLAVOR')
        : null;