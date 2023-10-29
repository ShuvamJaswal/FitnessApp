import 'package:fitness/src/onboarding/presentation/widgets/onboarding_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class AgeWidget extends ConsumerStatefulWidget {
  const AgeWidget(
      {super.key, required this.data, required this.pc, required this.p});
  final Map<String, dynamic> data;
  final PageController pc;
  final Function p;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends ConsumerState<AgeWidget> {
  num age = 10;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Let us know you better.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Expanded(child: Container()),
            const Row(
              children: [
                Text("AGE:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
            Text(
              "${age.toStringAsFixed(1)} Y",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            RulerPicker(
              scaleLineStyleList: const [
                ScaleLineStyle(
                    color: Colors.grey, width: 1.5, height: 30, scale: 0),
                ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 25, scale: 5),
                ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 15, scale: -1)
              ],
              rulerBackgroundColor: Colors.transparent,
              onBuildRulerScaleText: (index, value) {
                return '${value.toInt()}Y';
              },
              ranges: const [
                RulerRange(begin: 10, end: 80, scale: 1),
              ],
              onValueChanged: (value) {
                setState(() {
                  widget.p("age", value.toInt());
                  age = value;
                });
              },
              width: 250,
              height: 80,
              rulerMarginTop: 8,
            ),
            Expanded(child: Container()),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue.shade200,
                side: BorderSide(color: Colors.blue.shade200),
              ),
              onPressed: () async {
                // ref.watch(bodyDataModelProvider(widget.data)).when(
                //     loading: () => debugPrint('Loading'),
                //     error: (error, stackTrace) => debugPrint(error.toString()),
                //     data: (resultData) {
                //       print(resultData);
                //       ref
                //           .watch(personalizedPlansProvider(
                //               resultData.maintain_lose_gain))
                //           .whenData((value) {
                //         print(value);
                //         // context.pop();
                //         context.goNamed(AppRoute.home.name);
                //       });
                //     });
                showDialog(
                    context: context,
                    builder: (context) =>
                        Center(child: OnboardingLoading(data: widget.data)));
                return;
              },
              child: const Text("Submit"),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
