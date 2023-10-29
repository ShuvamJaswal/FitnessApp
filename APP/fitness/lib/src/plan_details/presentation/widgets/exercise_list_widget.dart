import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/src/exercise_details/model/exercise_details_model.dart';
import 'package:fitness/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

// ignore: must_be_immutable
class ExerciseListWidget extends ConsumerWidget {
  final ExerciseDetailsModel exerciseData;
  ExerciseListWidget({super.key, required this.exerciseData});
  OverlayEntry? myOverlayEntry;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.30,
      width: MediaQuery.of(context).size.width * 0.94,
      child: GestureDetector(
        onTap: () => context.pushNamed(AppRoute.exerciseDetails.name,
            extra: exerciseData),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          // color: Colors.white,
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onLongPress: () {
                  OverlayEntry overlayEntry = OverlayEntry(
                    builder: (context) => Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Center(
                            child: CachedNetworkImage(
                                errorWidget: (context, url, error) {
                                  return const Center(
                                      child: FaIcon(FontAwesomeIcons.dumbbell));
                                },
                                imageUrl: exerciseData.gifUrl)),
                      ],
                    ),
                  );
                  Overlay.of(context).insert(overlayEntry);
                  myOverlayEntry = overlayEntry;
                },
                onLongPressEnd: (_) {
                  myOverlayEntry?.remove();
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.28,
                        maxHeight: MediaQuery.of(context).size.width * 0.28,
                        minHeight: MediaQuery.of(context).size.width * 0.28,
                        minWidth: MediaQuery.of(context).size.width * 0.28),
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) => const Center(
                          child: FaIcon(
                        FontAwesomeIcons.dumbbell,
                      )),
                      imageUrl: exerciseData.gifUrl,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        exerciseData.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        exerciseData.bodyPart,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      ...exerciseData.secondaryMuscles
                          .map((e) => SingleChildScrollView(
                                child: Text(
                                  e,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                    ].take(4).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
