import '../../lib.dart';

class AutoSetWidget extends StatelessWidget {
  const AutoSetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StepWidget(
      label: autoSetLabel,
      desc: autoSetDesc,
      widget: Row(
        mainAxisAlignment: .spaceEvenly,
        children: [
          AppButton(
            icon: Icons.settings,
            height: 50,
            label: autoSetButtonText,
            onPressed: () async {
              BotToast.showLoading();
              try {
                setEnvVar(setCondition);
                createFile(setCondition);
                await selectAndModifyProject(context, .modify, setCondition);
                showNotification(envCreatedText);
              } catch (e) {
                showError("$errorText: ${e.toString()}");
              }

              BotToast.closeAllLoading();
            },
          ),
          AppButton(
            icon: Icons.delete_outline_rounded,
            height: 50,
            label: autoUnSetButtonText,
            onPressed: () async {
              try {
                rmEnvVar(setCondition);
                rmFile(setCondition);
                await selectAndModifyProject(context, .unModify, setCondition);
                showAlert(envRemovedText);
              } catch (e) {
                showError("$errorText: ${e.toString()}");
              }
              BotToast.closeAllLoading();
            },
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
