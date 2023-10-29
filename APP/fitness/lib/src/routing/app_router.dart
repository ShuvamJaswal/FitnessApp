import 'package:async/async.dart';
import 'package:fitness/src/exercise_details/presentation/exercise_details_screen.dart';
import 'package:fitness/src/home/models/workout_plan_model.dart';
import 'package:fitness/src/home/presentation/home_screen.dart';
import 'package:fitness/src/onboarding/data/onboarding_repository.dart';
import 'package:fitness/src/onboarding/presentation/onboarding_screen.dart';
import 'package:fitness/src/exercise_details/model/exercise_details_model.dart';
import 'package:fitness/src/plan_details/presentation/plan_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

enum AppRoute {
  onBoarding,
  workoutPlan,
  bodyDetails,
  exerciseDetails,
  home,
}

@riverpod
GoRouter goRouter(Ref ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  Stream refreshStream = StreamGroup.merge([
    // FirebaseAuth.instance.authStateChanges(),
  ]);
  return GoRouter(
      navigatorKey: rootNavigatorKey,
      refreshListenable: GoRouterRefreshStream(refreshStream),
      initialLocation: '/onboarding',
      routes: [
        GoRoute(
          path: '/home',
          name: AppRoute.home.name,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/onboarding',
          name: AppRoute.onBoarding.name,
          builder: (context, state) => OnBoardingScreen(),
        ),
        GoRoute(
          path: '/workoutPlan',
          name: AppRoute.workoutPlan.name,
          builder: (context, state) {
            final workoutPlan = state.extra as WorkoutPlanModel;
            return PlanDetailsScreen(workoutPlan: workoutPlan);
          },
        ),
        GoRoute(
          path: '/exerciseDetails',
          name: AppRoute.exerciseDetails.name,
          builder: (context, state) {
            final exerciseDetailsModel = state.extra as ExerciseDetailsModel;
            return ExerciseDetailsScreen(
                exerciseDetailsModel: exerciseDetailsModel);
          },
        )
      ],
      redirect: (context, state) async {
        final isOnboardingComplete =
            ref.read(onboardingRepositoryProvider).onBoardingComplete();
        if (!(await isOnboardingComplete)) {
          if (state.location != '/onboarding') {
            return state.namedLocation(AppRoute.onBoarding.name);
          }
        } else if (state.location == '/onboarding') {
          return state.namedLocation(AppRoute.home.name);
        }
        return null;
      });
}
