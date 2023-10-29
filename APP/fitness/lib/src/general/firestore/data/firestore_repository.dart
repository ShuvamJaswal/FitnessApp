import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firestore_repository.g.dart';

class FirestoreRepository {
  final FirebaseFirestore firestore;
  FirestoreRepository({
    required this.firestore,
  });
  Future setDoc(String docPath, Map<String, dynamic> data) {
    return firestore.doc(docPath).set(data, SetOptions(merge: true));
  }

  Future addDoc(String collectionPath, Map<String, dynamic> data) {
    return firestore.collection(collectionPath).add(data);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCollectionStream(
      String collectionPath) {
    return firestore.collection(collectionPath).snapshots();
  }
}

@riverpod
FutureOr<Map<String, dynamic>> docData(DocDataRef ref, String path) {
  return ref
      .watch(firebaseFirestoreInstanceProvider)
      .doc(path)
      .get()
      .then((value) => value.data()!);
}

@riverpod
FirebaseFirestore firebaseFirestoreInstance(FirebaseFirestoreInstanceRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirestoreRepository firestoreRepository(FirestoreRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreInstanceProvider);
  return FirestoreRepository(firestore: firestore);
}
