import 'package:fitness/src/general/API/dio_instance.dart';
import 'package:fitness/src/plan_details/model/plan_details_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'plan_details.g.dart';

@riverpod
FutureOr<PlanDetailsModel> planDetails(PlanDetailsRef ref,
    {required String planUrl}) {
  return ref
      .read(dioServiceProvider)
      .get(
        planUrl,
      )
      .then((value) => PlanDetailsModel.fromMap(value.data));
}
