import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/src/home/models/workout_plan_model.dart';
import 'package:fitness/src/onboarding/presentation/widgets/onboarding_loading.dart';
import 'package:fitness/src/plan_details/data/plan_details.dart';
import 'package:fitness/src/exercise_details/model/exercise_details_model.dart';
import 'package:fitness/src/plan_details/presentation/widgets/exercise_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliver_tools/sliver_tools.dart';

class _CardHeader extends StatelessWidget {
  final String title;

  const _CardHeader({
    // ignore: unused_element
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
    );
  }
}

class PlanDetailsScreen extends ConsumerWidget {
  final WorkoutPlanModel workoutPlan;
  const PlanDetailsScreen({required this.workoutPlan, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: ref.watch(planDetailsProvider(planUrl: workoutPlan.url)).when(
              data: (data) => CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    expandedHeight: 180.0,
                    pinned: true,
                    floating: true,
                    title: Text(data.title),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(children: [
                        CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const FaIcon(FontAwesomeIcons.dumbbell),
                          imageUrl:
                              'https://img.freepik.com/premium-photo/flat-lay-crossfit-gym-equipment_403156-27.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: 80,
                              width: double.infinity,
                              color: const Color(0xffD9D9D9).withOpacity(0.4),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Type: ',
                                        style: const TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                        children: <TextSpan>[
                                          TextSpan(text: data.type
                                              // style:
                                              //     DefaultTextStyle.of(context)
                                              //         .style
                                              //         .copyWith(fontSize: 16)
                                              ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      ' By: ${data.author}',
                                      style: const TextStyle(
                                          color: Color(0xfff7f7f7),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              )),
                        )
                      ]),
                    ),
                  ),
                  MultiSliver(
                    pushPinnedChildren: true,
                    children: [
                      ...data.exercises.entries
                          .map(
                            (value) => DayListBuilder(
                                dayTitle: value.key, exercises: value.value),
                          )
                          .toList(),
                    ],
                  )
                ],
              ),
              error: (error, stackTrace) => CustomErrorWidget(),
              loading: () => const Center(child: CircularProgressIndicator()),
            ));

    // ref.watch(planDetailsProvider(planUrl: workoutPlan.url)).when(
    //       data: (data) => SafeArea(
    //         child: Column(
    //           children: [
    //             Text(data.author),
    //             Text(data.title),
    //             Expanded(
    //               child: ListView.builder(
    //                 shrinkWrap: true,
    //                 itemCount: data.exercises.length,
    //                 itemBuilder: (context, index) {
    //                   return ExerciseListWidget(
    //                     exerciseData: ExerciseDetailsModel.fromMap(
    //                         data.exercises[index]),
    //                   );
    //                 },
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       error: (error, stackTrace) => Text(error.toString()),
    //       loading: () => CircularProgressIndicator(),
    //     ));
  }
}

class DayListBuilder extends StatelessWidget {
  const DayListBuilder(
      {super.key, required this.dayTitle, required this.exercises});
  final String dayTitle;
  final List exercises;
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: <Widget>[
        SliverPinnedHeader(
          child: _CardHeader(
            title: dayTitle == "Day 0" ? "All Exercises" : dayTitle,
          ),
        ),
        SliverList.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) => ExerciseListWidget(
            exerciseData: ExerciseDetailsModel.fromMap(exercises[index]),
          ),
        ),
      ],
    );
  }
}
