import 'package:fitness/src/onboarding/data/onboarding_repository.dart';
import 'package:fitness/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  CustomErrorWidget({this.errorMessage = 'Something Went Wrong'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 50.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'Error Occurred!',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            TextButton(
                onPressed: () {
                  context.canPop() ? context.pop() : null;
                },
                child: Text("Go Back"))
          ],
        ),
      ),
    );
  }
}

class OnboardingLoading extends ConsumerWidget {
  const OnboardingLoading({required this.data, super.key});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(bodyDataModelProvider(data)).when(loading: () {
      return const CircularProgressIndicator();
    }, error: (error, stackTrace) {
      debugPrint(error.toString());
      return CustomErrorWidget();
    }, data: (resultData) {
      return ref
          .watch(personalizedPlansProvider(resultData.maintain_lose_gain))
          .when(loading: () {
        debugPrint('Loading');
        return const CircularProgressIndicator();
      }, error: (error, stackTrace) {
        return CustomErrorWidget();
      }, data: (data) {
        context.goNamed(AppRoute.home.name);

        return const CircularProgressIndicator();
      });
    });
  }
}

      // ref
      //     .watch(personalizedPlansProvider(resultData.maintain_lose_gain))
      //     .whenData((value) {
      //   print(value);
      //   // context.pop();
      //   context.goNamed(AppRoute.home.name);
      // });
    
    // ref.watch(bodyDataModelProvider(data)).whenData((resultData) {
    //   ref
    //       .watch(personalizedPlansProvider(resultData.maintain_lose_gain))
    //       .whenData((value) {
    //     // context.pop();
    //     context.goNamed(AppRoute.home.name);
    //   });
    // });
  