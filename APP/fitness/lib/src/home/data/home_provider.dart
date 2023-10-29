import 'package:fitness/src/general/firestore/data/firestore_repository.dart';
import 'package:fitness/src/home/models/workout_plan_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_provider.g.dart';

@riverpod
Stream<List<WorkoutPlanModel>> workoutPlans(
  WorkoutPlansRef ref,
) {
  final FirestoreRepository firestore = ref.watch(firestoreRepositoryProvider);

  return firestore.getCollectionStream('plans').map((event) =>
      event.docs.map((data) => WorkoutPlanModel.fromMap(data.data())).toList());
}
