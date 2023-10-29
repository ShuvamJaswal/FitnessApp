import 'package:fitness/src/onboarding/presentation/widgets/activity_level_widget.dart';
import 'package:fitness/src/onboarding/presentation/widgets/age_widget.dart';
import 'package:fitness/src/onboarding/presentation/widgets/gender_widget.dart';
import 'package:fitness/src/onboarding/presentation/widgets/height_weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends ConsumerWidget {
  OnBoardingScreen({super.key});

  final PageController _pc = PageController();
  // ignore: unused_element
  void _goForward() {
    _pc.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void _goBack() {
    _pc.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  Map<String, dynamic> data = {
    "age": 10,
    "gender": "male",
    "height": 130,
    "weight": 40.0,
    "activity": 1
  };
  void update(dynamic key, dynamic value) {
    data.update(
      key,
      (val) => value,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
            child: GestureDetector(
      onHorizontalDragEnd: (dragEndDetails) {
        if (dragEndDetails.primaryVelocity! < 0) {
          // Page forwards
          // print('Move page forwards');
          // _goForward();
        } else if (dragEndDetails.primaryVelocity! > 0) {
          // Page backwards
          // print('Move page backwards');
          _goBack();
        }
      },
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pc,
        restorationId: '',
        children: [
          KeepAlivePage(
            child: GenderWidget(pc: _pc, p: update),
          ),
          KeepAlivePage(
            child: ActivityLevelWidget(pc: _pc, p: update),
          ),
          KeepAlivePage(
            child: HeightWeightWidget(pc: _pc, p: update),
          ),
          KeepAlivePage(
            child: AgeWidget(data: data, pc: _pc, p: update),
          ),
        ],
      ),
    )));
  }
}

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    /// Dont't forget this
    super.build(context);

    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
