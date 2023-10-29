import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fitness/src/general/API/api_url.dart';
import 'package:fitness/src/general/API/dio_instance.dart';
import 'package:fitness/src/general/auth/data/authentication_repository.dart';
import 'package:fitness/src/general/firestore/data/firestore_repository.dart';
import 'package:fitness/src/onboarding/model/body_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_repository.g.dart';

class OnboardingRepository {
  final AuthenticationRepository authRepository;
  final FirestoreRepository firestoreRepository;
  final DioService dioInstance;
  final String apiUrl;
  String text = '';
  OnboardingRepository(
      {required this.dioInstance,
      required this.apiUrl,
      required this.authRepository,
      required this.firestoreRepository});

  Future<bool> onBoardingComplete() async {
    var exists = false;
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        await firestoreRepository.firestore
            .doc("users/${FirebaseAuth.instance.currentUser!.uid}")
            .get()
            .then((doc) {
          if (doc.exists) {
            exists = doc.get('done');
          }
        });
      } catch (e) {
        exists = false;
      }
    }

    return exists;
  }

  Future<UserCredential> signInAnonymously() async {
    UserCredential user = await authRepository.signInAnonymously();
    if (user.user!.displayName.toString() == 'null' ||
        user.user!.displayName.toString() == '') {
      await firestoreRepository.setDoc('users/${user.user!.uid}/',
          {'user': 'user${user.user!.uid.toString().substring(0, 4)}'});
      user.user!.updateDisplayName(
          'user${user.user!.uid.toString().substring(0, 4)}');
    }
    FirebaseCrashlytics.instance.setUserIdentifier(user.user!.uid);
    return user;
  }
}

@riverpod
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  final auth = ref.watch(authenticationRepositoryProvider);
  final firestore = ref.watch(firestoreRepositoryProvider);
  final dioInstance = ref.read(dioServiceProvider);
  final apiUrl = ref.read(apiUrlProvider);
  return OnboardingRepository(
      dioInstance: dioInstance,
      apiUrl: apiUrl,
      authRepository: auth,
      firestoreRepository: firestore);
}

@riverpod
FutureOr<BodyDataModel> bodyDataModel(
    BodyDataModelRef ref, Map<String, dynamic> query) async {
  Map<String, dynamic> data = query;

  final userRef =
      await ref.read(onboardingRepositoryProvider).signInAnonymously();
  final userId = userRef.user!.uid;
  ref.read(firestoreRepositoryProvider).setDoc('users/$userId/', data);
  return ref
      .read(dioServiceProvider)
      .get('${ref.read(apiUrlProvider)}get_body_data', data: data)
      .then((value) {
    ref.read(firestoreRepositoryProvider).setDoc('users/$userId/', value.data);

    return BodyDataModel.fromMap(value.data);
  });
}

@riverpod
FutureOr<Map<String, List>> personalizedPlans(
    PersonalizedPlansRef ref, int maintainLoseGain) {
  Map<String, List> result = {
    'recommended': [],
    'others': [],
  };
  if (maintainLoseGain == 1) {
    result['recommended']!.addAll(['FL', 'HW']);
    result['others']!.addAll(['MG', 'ST']);
  } else {
    result['recommended']!.addAll(['MG', 'ST']);
    result['others']!.addAll(['HW', 'FL']);
  }
  final userId =
      ref.read(authenticationRepositoryProvider).fireAuth.currentUser!.uid;
  ref.read(firestoreRepositoryProvider).setDoc('users/$userId/', result);
  ref
      .read(firestoreRepositoryProvider)
      .setDoc('users/$userId/', {"done": true});
  return result;
}
