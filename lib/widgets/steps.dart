import '../lib.dart';

class StepWidget extends StatelessWidget {
  final String label;
  final String desc;
  final Widget widget;
  const StepWidget({
    super.key,
    required this.label,
    required this.desc,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.white, height: 20, indent: 20, endIndent: 20),
        Row(
          mainAxisAlignment: .center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            SizedBox(width: 8),
            Tooltip(message: desc, child: const Icon(Icons.help)),
          ],
        ),
        SizedBox(height: 10),
        widget,
      ],
    );
  }
}
