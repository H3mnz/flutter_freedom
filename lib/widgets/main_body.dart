import '../lib.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(appDescription),
              //! Flutter Download
              StepWidget(
                label: req,
                desc: flutterDownloadDesc,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    AppButton(
                      height: 50,
                      width: 180,
                      label: flutterDownload,
                      icon: Icons.link,
                      onPressed: () {
                        launchUrl(
                          Uri.https(
                            flutterDownloadLink,
                            flutterDownloadLinkPath,
                          ),
                        );
                      },
                    ),
                    AppButton(
                      height: 50,
                      width: 220,
                      label: sdkDownload,
                      icon: Icons.link,
                      onPressed: () {
                        launchUrl(
                          Uri.https(sdkDownloadLink, sdkDownloadLinkPath),
                        );
                      },
                    ),
                  ],
                ),
              ),

              //! ENV VAR Set
              StepWidget(
                label: envVarSetLabel,
                desc: envVarSetDesc,
                widget: Column(
                  children: [
                    PubMirrorRadio(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          height: 50,
                          width: 250,
                          label: envVarSet,
                          onPressed: () {
                            setEnvVar();
                          },
                          icon: Icons.settings_sharp,
                        ),

                        AppButton(
                          height: 50,
                          width: 150,
                          label: envVarDel,
                          icon: Icons.delete,
                          textColor: Colors.red,
                          onPressed: () {
                            rmEnvVar();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //! init.d Set
              StepWidget(
                label: initdSetLabel,
                desc: initdDesc,
                widget: Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    AppButton(
                      height: 50,
                      width: 210,
                      label: initdSet,
                      icon: Icons.download,
                      onPressed: () {
                        createFile();
                      },
                    ),
                    AppButton(
                      height: 50,
                      width: 190,
                      label: initdDel,
                      textColor: Colors.red,
                      icon: Icons.delete,
                      onPressed: () {
                        rmFile();
                      },
                    ),
                  ],
                ),
              ),

              //! Gradle Set in Project
              StepWidget(
                label: gradleSet,
                desc: gradleSetDesc,
                widget: Column(
                  children: [
                    GradleMirrorRadio(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        AppButton(
                          height: 50,
                          width: 240,
                          label: gradleSetButtonText,
                          icon: Icons.settings,
                          onPressed: () {
                            selectAndModifyProject(context, .modify);
                          },
                        ),
                        AppButton(
                          height: 50,
                          width: 160,
                          icon: Icons.refresh,
                          label: gradleUnSetButtonText,
                          textColor: Colors.red,
                          onPressed: () {
                            selectAndModifyProject(context, .unModify);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
