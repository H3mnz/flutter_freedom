import '../../lib.dart';

class AutoSetStep extends StatefulWidget {
  const AutoSetStep({super.key});

  @override
  State<AutoSetStep> createState() => _AutoSetStepState();
}

class _AutoSetStepState extends State<AutoSetStep> {
  List<bool> _selectedCondition = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    setCondition == .auto
        ? _selectedCondition = [true, false]
        : _selectedCondition = [false, true];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                children: [
                  Expanded(child: Text(setMirror)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ToggleButtons(
                      isSelected: _selectedCondition,
                      borderRadius: BorderRadius.circular(10),
                      onPressed: (index) {
                        setState(() {
                          setCondition == .auto
                              ? setCondition = .manual
                              : setCondition = .auto;
                        });
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("اتوماتیک"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("دستی"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            setCondition == .auto ? AutoSetWidget() : ManualSetWidget(),
          ],
        ),
      ),
    );
  }
}
