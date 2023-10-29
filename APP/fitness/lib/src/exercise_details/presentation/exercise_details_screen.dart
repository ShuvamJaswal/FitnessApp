import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/src/exercise_details/model/exercise_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExerciseDetailsScreen extends ConsumerWidget {
  const ExerciseDetailsScreen({super.key, required this.exerciseDetailsModel});
  final ExerciseDetailsModel exerciseDetailsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              stretchTriggerOffset: 40,
              title: Text(
                exerciseDetailsModel.name,
                style: const TextStyle(color: Colors.black),
              ),
              expandedHeight: MediaQuery.of(context).size.width * 0.7,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                  // StretchMode.blurBackground
                ],
                background: SizedBox(
                  width: double.infinity,
                  // width: 20,
                  // height: 20,
                  child: SafeArea(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            // width: 2000.0,
                            // height: 2000.0,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.8)),
                            child: Center(
                              child: Card(
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                          child: FaIcon(
                                              FontAwesomeIcons.dumbbell)),
                                  imageUrl: exerciseDetailsModel.gifUrl,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // BackdropFilter(
                        //   child: Container(
                        //       width: double.infinity, color: Colors.white),
                        //   filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        // ),
                        // Card(
                        //   child: CachedNetworkImage(
                        //     // width: 50,
                        //     imageUrl: exerciseDetailsModel.gifUrl,
                        //     fit: BoxFit.fitHeight,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextButton.icon(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white60,
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => const Color(0xAA5A6D9E),
                          ),
                        ),
                        onPressed: () {
                          launchUrlString(
                              "https://www.youtube.com/results?search_query=${exerciseDetailsModel.name} exercise");
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.youtube,
                        ),
                        label: const Text("Search on Youtube"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Exercise For: ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Wrap(
                        spacing: 30.0,
                        runSpacing: 6.0,
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            "● ${exerciseDetailsModel.bodyPart}",
                          ),
                          Text("● ${exerciseDetailsModel.target}"),
                          ...exerciseDetailsModel.secondaryMuscles.map(
                            (e) => Text("● $e"),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "INSTRUCTIONS: ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ...exerciseDetailsModel.instructions
                        .mapIndexed((index, value) => Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("●  $value",
                                  style: Theme.of(context).textTheme.bodyLarge),
                            )),
                    const SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
            ),
          ],
          // children: [
          //   Text(exerciseDetailsModel.name)
          // ],
        ));
  }
}

class ChipWidget extends StatelessWidget {
  const ChipWidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 35,
      width: 120,
      // padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xAA5A6D9E),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}
