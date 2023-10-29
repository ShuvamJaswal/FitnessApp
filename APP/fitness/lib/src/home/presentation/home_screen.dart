import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/src/general/auth/data/authentication_repository.dart';
import 'package:fitness/src/general/firestore/data/firestore_repository.dart';
import 'package:fitness/src/home/data/home_provider.dart';
import 'package:fitness/src/home/presentation/widgets/workout_entry_widget.dart';
import 'package:fitness/src/onboarding/presentation/widgets/onboarding_loading.dart';
import 'package:fitness/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(firestoreRepositoryProvider).set_doc(
    //     'plans/ALL',
    //     WorkoutPlanModel(
    //             author: 'FitnessApp',
    //             fromFirebase: false,
    //             id: 'ALL',
    //             days: '0',
    //             title: "All Exercises",
    //             type: 'Full',
    //             url: ref.watch(apiUrlProvider) + 'plan/ALL')
    //         .toMap());
    // ref.read(firestoreRepositoryProvider).set_doc(
    //     'plans/MG',
    //     WorkoutPlanModel(
    //             author: 'FitnessApp',
    //             fromFirebase: false,
    //             id: 'MG',
    //             days: '1',
    //             title: "Muscle Gain",
    //             type: 'Full',
    //             url: ref.watch(apiUrlProvider) + 'plan/MG')
    //         .toMap());
    // ref.read(firestoreRepositoryProvider).set_doc(
    //     'plans/FL',
    //     WorkoutPlanModel(
    //             author: 'FitnessApp',
    //             fromFirebase: false,
    //             id: 'FL',
    //             days: '1',
    //             title: "Fat Loss",
    //             type: 'Full',
    //             url: ref.watch(apiUrlProvider) + 'plan/FL')
    //         .toMap());
    // ref.read(firestoreRepositoryProvider).set_doc(
    //     'plans/ST',
    //     WorkoutPlanModel(
    //             author: 'FitnessApp',
    //             fromFirebase: false,
    //             id: 'ST',
    //             days: '0',
    //             title: "Strength Training",
    //             type: 'Full',
    //             url: ref.watch(apiUrlProvider) + 'plans/ST')
    //         .toMap());
    // ref.read(firestoreRepositoryProvider).set_doc(
    //     'plans/HW',
    //     WorkoutPlanModel(
    //             author: 'FitnessApp',
    //             fromFirebase: false,
    //             id: 'HW',
    //             days: '1',
    //             title: "Home Workout",
    //             type: 'Full',
    //             url: ref.watch(apiUrlProvider) + 'id/HW')
    //         .toMap());
    return Scaffold(
      backgroundColor: const Color.fromRGBO(65, 74, 97, 100),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              stretch: true,
              expandedHeight: 400.0,
              pinned: true,
              floating: true,
              title: const Text("Fitness"),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://img.freepik.com/premium-photo/flat-lay-crossfit-gym-equipment_403156-27.jpg',
                    placeholder: (context, url) =>
                        const FaIcon(FontAwesomeIcons.dumbbell),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ref
                                  .watch(docDataProvider(
                                      'users/${ref.read(firebaseAuthInstanceProvider).currentUser!.uid}/'))
                                  .when(
                                    data: (data) {
                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20.0, 8, 8, 20),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "BMI: ${data['bmi']}",
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Weight: ${data['weight'].toString()}KG   Ideal Weight: ${data['ideal_weight'].toString()}KG",
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Goal: ${data['maintain_lose_gain'] == 0 ? 'Maintain Weight' : data['maintain_lose_gain'] == 1 ? 'Lose Weight' : 'Gain Weight'}',
                                                    // "${data['ideal_weight'] < data['weight'] ? 'Gain Weight' : 'Lose Weight'}",
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Daily Calories: ${data['maintain_lose_gain'] == 0 ? data['gain_weight_calories'] : data['maintain_lose_gain'] == 1 ? data['lose_weight_calories'] : data['gain_weight_calories']}Cal",
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Daily Requirements-",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                      "Fats: ${double.parse(data['fat'].toString()).toStringAsFixed(1)}g"),
                                                  Text(
                                                      "Protein: ${double.parse(data['protein'].toString()).toStringAsFixed(1)}g"),
                                                  Text(
                                                      "Carbs: ${double.parse(data['carbs'].toString()).toStringAsFixed(1)}g"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    error: (error, stackTrace) =>
                                        SliverToBoxAdapter(
                                            child: CustomErrorWidget()),
                                    loading: () => const Center(
                                        child: CircularProgressIndicator()),
                                  ),
                            ],
                          ),
                        )),
                  )
                ]),
              ),
            ),
            ref
                .watch(docDataProvider(
                    'users/${ref.read(firebaseAuthInstanceProvider).currentUser!.uid}/'))
                .when(
                  data: (personalizedData) {
                    return ref.watch(workoutPlansProvider).when(
                          data: (data) {
                            List others = [];
                            List recommended = [];
                            for (final plan in data) {
                              if (personalizedData['recommended']!
                                  .contains(plan.id)) {
                                recommended.add(plan);
                              } else {
                                others.add(plan);
                              }
                            }

                            return MultiSliver(
                                pushPinnedChildren: true,
                                children: [
                                  MultiSliver(
                                    pushPinnedChildren: true,
                                    children: [
                                      SliverPinnedHeader(
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          child: const Text(
                                            "Recommended",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SliverList.builder(
                                          itemCount: recommended.length,
                                          itemBuilder: (context, index) {
                                            final workoutPlanModel =
                                                recommended[index];
                                            return GestureDetector(
                                              onTap: () => {
                                                context.pushNamed(
                                                    AppRoute.workoutPlan.name,
                                                    extra: workoutPlanModel)
                                              },
                                              child: WorkoutEntryWidget(
                                                workoutPlanModel:
                                                    workoutPlanModel,
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                  MultiSliver(
                                      pushPinnedChildren: true,
                                      children: [
                                        SliverPinnedHeader(
                                          child: Container(
                                            alignment: Alignment.bottomCenter,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 12),
                                            decoration: const BoxDecoration(
                                              color: Colors.black,
                                              border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            child: const Text(
                                              "Other",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SliverList.builder(
                                            itemCount: others.length,
                                            itemBuilder: (context, index) {
                                              final workoutPlanModel =
                                                  others[index];
                                              debugPrint(
                                                  workoutPlanModel.toString());
                                              return GestureDetector(
                                                onTap: () => {
                                                  context.pushNamed(
                                                      AppRoute.workoutPlan.name,
                                                      extra: workoutPlanModel)
                                                },
                                                child: WorkoutEntryWidget(
                                                  workoutPlanModel:
                                                      workoutPlanModel,
                                                ),
                                              );
                                            }),
                                      ])
                                ]);
                          },
                          error: (error, stackTrace) {
                            debugPrint(error.toString());
                            return SliverToBoxAdapter(
                                child: CustomErrorWidget());
                          },
                          loading: () => const SliverToBoxAdapter(
                              child:
                                  Center(child: CircularProgressIndicator())),
                        );
                  },
                  error: (error, stackTrace) =>
                      SliverToBoxAdapter(child: CustomErrorWidget()),
                  loading: () => const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator())),
                ),
          ],
        ),
      ),
    );
  }
}
