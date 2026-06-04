import '../lib.dart';

class PubMirrorRadio extends StatefulWidget {
  const PubMirrorRadio({super.key});

  @override
  State<PubMirrorRadio> createState() => _PubMirrorRadioState();
}

class _PubMirrorRadioState extends State<PubMirrorRadio> {
  @override
  Widget build(BuildContext context) {
    return RadioGroup<SelectedPubMirror>(
      groupValue: selectedPubMirror,
      onChanged: (SelectedPubMirror? value) {
        setState(() {
          selectedPubMirror = value ?? SelectedPubMirror.myket;
        });
      },
      child: const Row(
        mainAxisAlignment: .spaceEvenly,
        crossAxisAlignment: .start,
        children: <Widget>[
          Row(
            mainAxisSize: .min,
            children: [
              Radio<SelectedPubMirror>(value: SelectedPubMirror.myket),
              Text('مایکت'),
            ],
          ),
          Row(
            mainAxisSize: .min,
            children: [
              Radio<SelectedPubMirror>(value: SelectedPubMirror.runflare),
              Text('رانفلر'),
            ],
          ),
          Row(
            mainAxisSize: .min,
            children: [
              Radio<SelectedPubMirror>(value: SelectedPubMirror.flutterIoCn),
              Text('flutter-io.cn'),
            ],
          ),
        ],
      ),
    );
  }
}

class GradleMirrorRadio extends StatefulWidget {
  const GradleMirrorRadio({super.key});

  @override
  State<GradleMirrorRadio> createState() => _GradleMirrorRadioState();
}

class _GradleMirrorRadioState extends State<GradleMirrorRadio> {
  @override
  Widget build(BuildContext context) {
    return RadioGroup<SelectedGradleMirror>(
      groupValue: selectedGradleMirror,
      onChanged: (SelectedGradleMirror? value) {
        setState(() {
          selectedGradleMirror = value ?? SelectedGradleMirror.myket;
        });
      },
      child: const Row(
        mainAxisAlignment: .spaceEvenly,
        crossAxisAlignment: .start,
        children: <Widget>[
          Row(
            mainAxisSize: .min,
            children: [
              Radio<SelectedGradleMirror>(value: SelectedGradleMirror.myket),
              Text('مایکت'),
            ],
          ),
          Row(
            mainAxisSize: .min,
            children: [
              Radio<SelectedGradleMirror>(value: SelectedGradleMirror.runflare),
              Text('رانفلر'),
            ],
          ),
        ],
      ),
    );
  }
}
