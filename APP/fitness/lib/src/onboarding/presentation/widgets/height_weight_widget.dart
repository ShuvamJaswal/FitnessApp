import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class HeightWeightWidget extends StatefulWidget {
  const HeightWeightWidget({super.key, required this.pc, required this.p});
  final PageController pc;
  final Function p;

  @override
  State<HeightWeightWidget> createState() => _HeightWeightWidgetState();
}

class _HeightWeightWidgetState extends State<HeightWeightWidget> {
  @override
  void initState() {
    _weightController = RulerPickerController(value: currentWeight);
    _heightController = RulerPickerController(value: currentHeight);
    super.initState();
  }

  num currentWeight = 40;
  num currentHeight = 130;
  RulerPickerController? _weightController;
  RulerPickerController? _heightController;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.blue[200],
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
                Text("Weight:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
            Text(
              "${currentWeight.toStringAsFixed(1)} KG",
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
                return '${value.toInt()}KG';
              },
              ranges: const [
                RulerRange(begin: 40, end: 180, scale: 0.1),
              ],

              controller: _weightController,
              onValueChanged: (value) {
                setState(() {
                  widget.p("weight", value.toInt());
                  currentWeight = value;
                });
              },
              width: 250,
              height: 80,
              rulerMarginTop: 8,
              // marker: Container(
              //     width: 8,
              //     height: 50,
              //     decoration: BoxDecoration(
              //         color: Colors.red.withAlpha(100),
              //         borderRadius: BorderRadius.circular(5))),
            ),
            const Row(
              children: [
                Text("Height:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "${currentHeight.toStringAsFixed(1)} Cm",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Text(
                  "(${currentHeight ~/ (2.54 * 12)}\"${((currentHeight ~/ 2.54) % 12)}')",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
            RulerPicker(
              controller: _heightController,
              rulerBackgroundColor: Colors.transparent,
              onBuildRulerScaleText: (index, value) {
                return '${value.toInt()}Cm';
              },
              ranges: const [
                RulerRange(begin: 130, end: 230, scale: 1),
              ],

              onValueChanged: (value) {
                widget.p("height", value.toInt());

                setState(() {
                  currentHeight = value;
                });
              },
              width: 250,
              height: 80,
              rulerMarginTop: 8,
              // marker: Container(
              //     width: 8,
              //     height: 50,
              //     decoration: BoxDecoration(
              //         color: Colors.red.withAlpha(100),
              //         borderRadius: BorderRadius.circular(5))),
            ),
            Expanded(child: Container()),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue.shade200,
                  side: BorderSide(color: Colors.blue.shade200),
                ),
                onPressed: () {
                  widget.p("height", currentHeight.toInt());
                  widget.p("weight", currentWeight);
                  widget.pc.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                child: const Text('Next')),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
