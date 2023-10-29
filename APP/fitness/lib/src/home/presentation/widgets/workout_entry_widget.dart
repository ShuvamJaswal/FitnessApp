import 'package:fitness/src/home/models/workout_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutEntryWidget extends ConsumerWidget {
  final WorkoutPlanModel workoutPlanModel;
  const WorkoutEntryWidget({required this.workoutPlanModel, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(
        data: ThemeData(
            // textTheme:
            // TextTheme(
            //   bodyLarge: TextStyle(),
            //   bodyMedium: TextStyle(),
            // ).apply(
            //     // bodyColor: Colors.orange,
            //     // displayColor: Colors.blue,
            //     ),
            ),
        child: Card(
          color: Colors.blue[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      "By ${workoutPlanModel.author}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                ListTile(
                  title: Text(
                    workoutPlanModel.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(
                    ' ${workoutPlanModel.type}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: ElevatedButton(
                //     style: ButtonStyle(
                //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(18.0),
                //         ),
                //       ),
                //       elevation:
                //           MaterialStateProperty.resolveWith((states) => 0),
                //       foregroundColor:
                //           MaterialStateProperty.resolveWith<Color?>(
                //         (Set<MaterialState> states) {
                //           return Colors.black; // Use the component's default.
                //         },
                //       ),
                //       backgroundColor:
                //           MaterialStateProperty.resolveWith<Color?>(
                //         (Set<MaterialState> states) {
                //           return Colors.white; // Use the component's default.
                //         },
                //       ),
                //     ),
                //     onPressed: () {},
                //     child: Text('Explore'),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
