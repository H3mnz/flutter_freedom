import '../../lib.dart';

class ManualSetWidget extends StatelessWidget {
  const ManualSetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
                      setEnvVar(setCondition);
                    },
                    icon: Icons.settings_sharp,
                  ),

                  AppButton(
                    height: 50,
                    width: 150,
                    label: envVarDel,
                    icon: Icons.delete_outline_rounded,
                    textColor: Colors.red,
                    onPressed: () {
                      rmEnvVar(setCondition);
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
                icon: Icons.settings,
                onPressed: () {
                  createFile(setCondition);
                },
              ),
              AppButton(
                height: 50,
                width: 190,
                label: initdDel,
                textColor: Colors.red,
                icon: Icons.delete_outline_rounded,
                onPressed: () {
                  rmFile(setCondition);
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
                      selectAndModifyProject(context, .modify, setCondition);
                    },
                  ),
                  AppButton(
                    height: 50,
                    width: 160,
                    icon: Icons.refresh,
                    label: gradleUnSetButtonText,
                    textColor: Colors.amber,
                    onPressed: () {
                      selectAndModifyProject(context, .unModify, setCondition);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
