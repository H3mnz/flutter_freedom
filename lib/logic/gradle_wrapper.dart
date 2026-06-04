import 'dart:io';
import '../lib.dart';

//TODO: add logic for linux and macos

Future<void> selectAndModifyProject(
  BuildContext context,
  GradleWrapperAction action,
) async {
  try {
    // Open folder picker
    String? selectedDirectory = await FilePicker.getDirectoryPath(
      dialogTitle: pickerDialogTitle,
      lockParentWindow: true,
    );
    BotToast.showLoading();

    if (selectedDirectory == null) {
      // User canceled
      return;
    }

    final projectDir = Directory(selectedDirectory);

    // Check if Flutter project
    final pubspecFile = File('${projectDir.path}\\pubspec.yaml');

    final androidFolder = Directory('${projectDir.path}\\android');

    if (!pubspecFile.existsSync() || !androidFolder.existsSync()) {
      showError(notFlutterProjectText);
      return;
    }

    // gradle-wrapper.properties path
    final gradleWrapperFile = File(
      '${projectDir.path}\\android\\gradle\\wrapper\\gradle-wrapper.properties',
    );

    if (!gradleWrapperFile.existsSync()) {
      showError(noGradleFileText);
      return;
    }

    // Read file
    String content = await gradleWrapperFile.readAsString();

    // Replace distributionUrl
    if (action == .modify) {
      content = content.replaceAllMapped(
        RegExp(r'distributionUrl=.*?/distributions/(gradle-.*?\.zip)'),
        (match) {
          final gradleFile = match.group(1)!;

          return 'distributionUrl=https://maven.myket.ir/gradle/distributions/$gradleFile';
        },
      );
    } else if (action == .unModify) {
      content = content.replaceAllMapped(
        RegExp(r'distributionUrl=.*?/distributions/(gradle-.*?\.zip)'),
        (match) {
          final gradleFile = match.group(1)!;

          return 'distributionUrl=https\\://services.gradle.org/distributions/$gradleFile';
        },
      );
    }

    // Write updated content
    await gradleWrapperFile.writeAsString(content);

    showNotification(envCreatedText);
  } catch (e) {
    showError("$errorText: ${e.toString()}");
    throw Exception(e);
  }
  BotToast.closeAllLoading();
}
