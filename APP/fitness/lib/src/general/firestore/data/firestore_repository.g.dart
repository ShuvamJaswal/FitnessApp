// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$docDataHash() => r'2736e93f06cca5bf0a6cb3bdd8783c58b2e531fe';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef DocDataRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;

/// See also [docData].
@ProviderFor(docData)
const docDataProvider = DocDataFamily();

/// See also [docData].
class DocDataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [docData].
  const DocDataFamily();

  /// See also [docData].
  DocDataProvider call(
    String path,
  ) {
    return DocDataProvider(
      path,
    );
  }

  @override
  DocDataProvider getProviderOverride(
    covariant DocDataProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'docDataProvider';
}

/// See also [docData].
class DocDataProvider extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [docData].
  DocDataProvider(
    this.path,
  ) : super.internal(
          (ref) => docData(
            ref,
            path,
          ),
          from: docDataProvider,
          name: r'docDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$docDataHash,
          dependencies: DocDataFamily._dependencies,
          allTransitiveDependencies: DocDataFamily._allTransitiveDependencies,
        );

  final String path;

  @override
  bool operator ==(Object other) {
    return other is DocDataProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$firebaseFirestoreInstanceHash() =>
    r'61f08d99be908bcf239586847028e42d3dff76f5';

/// See also [firebaseFirestoreInstance].
@ProviderFor(firebaseFirestoreInstance)
final firebaseFirestoreInstanceProvider =
    AutoDisposeProvider<FirebaseFirestore>.internal(
  firebaseFirestoreInstance,
  name: r'firebaseFirestoreInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseFirestoreInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseFirestoreInstanceRef
    = AutoDisposeProviderRef<FirebaseFirestore>;
String _$firestoreRepositoryHash() =>
    r'b6e5edd733e5f625ae57f432b54d3d2fd9490549';

/// See also [firestoreRepository].
@ProviderFor(firestoreRepository)
final firestoreRepositoryProvider =
    AutoDisposeProvider<FirestoreRepository>.internal(
  firestoreRepository,
  name: r'firestoreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firestoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreRepositoryRef = AutoDisposeProviderRef<FirestoreRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
