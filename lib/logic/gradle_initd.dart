import 'package:flutter_freedom/lib.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

//TODO: add logic for linux and macos

const String mirrorFileContent = r'''
import org.gradle.api.artifacts.dsl.RepositoryHandler
import org.gradle.api.artifacts.repositories.MavenArtifactRepository

val MIRROR = "https://maven.myket.ir"

val REDIRECT_HOSTS = setOf(
    "repo.maven.apache.org",
    "repo1.maven.org",
    "dl.google.com",
    "maven.google.com",
    "plugins.gradle.org",
    "jitpack.io",
    "jcenter.bintray.com",
    "maven.fabric.io",
    "developer.huawei.com",
    "storage.googleapis.com",
)

fun shouldRedirect(url: String): Boolean =
    REDIRECT_HOSTS.any { host -> url.contains(host, ignoreCase = true) }

fun interceptRepos(repos: RepositoryHandler) {
    repos.whenObjectAdded {
        val repo = this as? MavenArtifactRepository ?: return@whenObjectAdded
        val original = repo.url.toString()

        if (shouldRedirect(original)) {
            println("[Myket Mirror] Redirecting: $original -> $MIRROR")
            repo.setUrl(MIRROR)
        }
    }
}

gradle.beforeSettings {
    pluginManagement {
        interceptRepos(repositories)
        repositories {
            maven(url = MIRROR)
        }
    }

    @Suppress("UnstableApiUsage")
    dependencyResolutionManagement {
        interceptRepos(repositories)
        repositories {
            maven(url = MIRROR) {
                name = "myket-mirror"
            }
        }
    }
}

gradle.allprojects {
    buildscript {
        interceptRepos(repositories)
        repositories {
            clear()
            maven(url = MIRROR)
        }
    }

    interceptRepos(repositories)

    repositories.whenObjectAdded {
        val repo = this as? MavenArtifactRepository ?: return@whenObjectAdded
        val original = repo.url.toString()

        if (shouldRedirect(original)) {
            println("[Myket Mirror] Redirecting project repo: $original -> $MIRROR")
            repo.setUrl(MIRROR)
        }
    }
}
''';

Future<void> createFile() async {
  BotToast.showLoading();
  try {
    final userHome = Platform.environment['USERPROFILE'];
    if (userHome == null) {
      showError(userFolderNotFoundText);
      throw Exception(userFolderNotFoundText);
    }
    final gradlePath = p.join(userHome, '.gradle');
    final initdFolder = Directory(p.join(gradlePath, 'init.d'));
    if (!await initdFolder.exists()) {
      await initdFolder.create(recursive: true);
    }
    final mirrorFile = File(p.join(initdFolder.path, 'mirror.init.gradle.kts'));
    final bool fileExists = await mirrorFile.exists();
    final bool fileIsOK = fileExists == true
        ? await mirrorFile.readAsString() == mirrorFileContent
        : false;
    if (fileExists && fileIsOK) {
      showAlert(fileAlreadyExistText);
    } else if (fileExists && !fileIsOK) {
      await mirrorFile.delete();
      await mirrorFile.writeAsString(mirrorFileContent);
      showAlert(fileChangedText);
    } else {
      await mirrorFile.writeAsString(mirrorFileContent);
      showNotification(fileCreatedText);
    }
  } catch (e) {
    showError("$errorText: ${e.toString()}");
    throw Exception(e.toString());
  }
  BotToast.closeAllLoading();
}

Future<void> rmFile() async {
  BotToast.showLoading();
  try {
    final userHome = Platform.environment['USERPROFILE'];
    if (userHome == null) {
      showError(userFolderNotFoundText);
      throw Exception(userFolderNotFoundText);
    }
    final gradlePath = p.join(userHome, '.gradle');
    final initdFolder = Directory(p.join(gradlePath, 'init.d'));
    if (!await initdFolder.exists()) {
      await initdFolder.create(recursive: true);
    }
    final mirrorFile = File(p.join(initdFolder.path, 'mirror.init.gradle.kts'));
    if (await mirrorFile.exists()) {
      await mirrorFile.delete();
      showAlert(fileRemovedText);
    } else {
      showError(fileNotExistText);
    }
  } catch (e) {
    showError("$errorText: ${e.toString()}");
    throw Exception(e.toString());
  }
  BotToast.closeAllLoading();
}
