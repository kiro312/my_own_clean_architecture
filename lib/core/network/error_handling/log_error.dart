import 'dart:developer';


class LogError {
  static void logErrorAndReportIt({String errorMessage = ''}) {
    String logMessage = "${DateTime.now().toIso8601String()} - $errorMessage";

    log(logMessage);
    // FirebaseCrashlyticsService.logMessage(logMessage);
  }

  static void logError({String errorMessage = ''}) {
    String logMessage = "${DateTime.now().toIso8601String()} - $errorMessage";

    log(logMessage);
  }
}
