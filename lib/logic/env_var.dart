import 'dart:io';
import 'package:flutter_freedom/lib.dart';

//TODO: add logic for linux and macos

void setEnvVar() async {
  BotToast.showLoading();
  try {
    if (selectedPubMirror == .myket) {
      await Process.run('powershell', [
        '-Command',
        '[Environment]::SetEnvironmentVariable("PUB_HOSTED_URL", "https://pub.myket.ir","User"); [Environment]::SetEnvironmentVariable("FLUTTER_STORAGE_BASE_URL", "https://pub.myket.ir","User")',
      ]);
    } else if (selectedPubMirror == .runflare) {
      await Process.run('powershell', [
        '-Command',
        '[Environment]::SetEnvironmentVariable("PUB_HOSTED_URL", "https://mirror-flutter.runflare.com","User"); [Environment]::SetEnvironmentVariable("FLUTTER_STORAGE_BASE_URL", "https://mirror-gcs.runflare.com","User")',
      ]);
    } else if (selectedPubMirror == .flutterIoCn) {
      await Process.run('powershell', [
        '-Command',
        '[Environment]::SetEnvironmentVariable("PUB_HOSTED_URL", "https://pub.flutter-io.cn","User"); [Environment]::SetEnvironmentVariable("FLUTTER_STORAGE_BASE_URL", "https://storage.flutter-io.cn","User")',
      ]);
    }

    showNotification(envCreatedText);
    // },
  } catch (e) {
    showError("$errorText: ${e.toString()}");
  }
  BotToast.closeAllLoading();
}

void rmEnvVar() async {
  BotToast.showLoading();
  try {
    await Process.run('powershell', [
      '-Command',
      '[Environment]::SetEnvironmentVariable("PUB_HOSTED_URL", "","User"); [Environment]::SetEnvironmentVariable("FLUTTER_STORAGE_BASE_URL", "","User")',
    ]);

    showAlert(envRemovedText);
  } catch (e) {
    showError("$errorText: ${e.toString()}");
  }
  BotToast.closeAllLoading();
}
