import 'dart:io';

import 'package:ai_hr/core/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:unique_identifier/unique_identifier.dart';

abstract interface class UniqueIdentifierWrapper {
  const UniqueIdentifierWrapper();

  Future<String?> get uniqueIdentifier;
}

class UniqueIdentifierWrapperImpl extends UniqueIdentifierWrapper {
  @override
  Future<String?> get uniqueIdentifier async {
    String? identifier;
    try {
      identifier = await UniqueIdentifier.serial;
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to get unique identifier',
        error: error,
        stacktrace: stackTrace,
      );
      if (kIsWeb || Platform.isMacOS) {
        return "some_identifier";
      }
    }
    return identifier;
  }
}
