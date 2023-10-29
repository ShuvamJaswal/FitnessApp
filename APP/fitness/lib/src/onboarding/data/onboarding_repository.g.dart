// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingRepositoryHash() =>
    r'fc2e39df70c9203001ddc441ead92b7806652a36';

/// See also [onboardingRepository].
@ProviderFor(onboardingRepository)
final onboardingRepositoryProvider =
    AutoDisposeProvider<OnboardingRepository>.internal(
  onboardingRepository,
  name: r'onboardingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OnboardingRepositoryRef = AutoDisposeProviderRef<OnboardingRepository>;
String _$bodyDataModelHash() => r'77e9c6d2321def46cb10525bde335fdba4fa4daf';

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

typedef BodyDataModelRef = AutoDisposeFutureProviderRef<BodyDataModel>;

/// See also [bodyDataModel].
@ProviderFor(bodyDataModel)
const bodyDataModelProvider = BodyDataModelFamily();

/// See also [bodyDataModel].
class BodyDataModelFamily extends Family<AsyncValue<BodyDataModel>> {
  /// See also [bodyDataModel].
  const BodyDataModelFamily();

  /// See also [bodyDataModel].
  BodyDataModelProvider call(
    Map<String, dynamic> query,
  ) {
    return BodyDataModelProvider(
      query,
    );
  }

  @override
  BodyDataModelProvider getProviderOverride(
    covariant BodyDataModelProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'bodyDataModelProvider';
}

/// See also [bodyDataModel].
class BodyDataModelProvider extends AutoDisposeFutureProvider<BodyDataModel> {
  /// See also [bodyDataModel].
  BodyDataModelProvider(
    this.query,
  ) : super.internal(
          (ref) => bodyDataModel(
            ref,
            query,
          ),
          from: bodyDataModelProvider,
          name: r'bodyDataModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bodyDataModelHash,
          dependencies: BodyDataModelFamily._dependencies,
          allTransitiveDependencies:
              BodyDataModelFamily._allTransitiveDependencies,
        );

  final Map<String, dynamic> query;

  @override
  bool operator ==(Object other) {
    return other is BodyDataModelProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$personalizedPlansHash() => r'1d0a9577e5eb4c2128fbef32b5b576af38a559ea';
typedef PersonalizedPlansRef
    = AutoDisposeFutureProviderRef<Map<String, List<dynamic>>>;

/// See also [personalizedPlans].
@ProviderFor(personalizedPlans)
const personalizedPlansProvider = PersonalizedPlansFamily();

/// See also [personalizedPlans].
class PersonalizedPlansFamily
    extends Family<AsyncValue<Map<String, List<dynamic>>>> {
  /// See also [personalizedPlans].
  const PersonalizedPlansFamily();

  /// See also [personalizedPlans].
  PersonalizedPlansProvider call(
    int maintainLoseGain,
  ) {
    return PersonalizedPlansProvider(
      maintainLoseGain,
    );
  }

  @override
  PersonalizedPlansProvider getProviderOverride(
    covariant PersonalizedPlansProvider provider,
  ) {
    return call(
      provider.maintainLoseGain,
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
  String? get name => r'personalizedPlansProvider';
}

/// See also [personalizedPlans].
class PersonalizedPlansProvider
    extends AutoDisposeFutureProvider<Map<String, List<dynamic>>> {
  /// See also [personalizedPlans].
  PersonalizedPlansProvider(
    this.maintainLoseGain,
  ) : super.internal(
          (ref) => personalizedPlans(
            ref,
            maintainLoseGain,
          ),
          from: personalizedPlansProvider,
          name: r'personalizedPlansProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$personalizedPlansHash,
          dependencies: PersonalizedPlansFamily._dependencies,
          allTransitiveDependencies:
              PersonalizedPlansFamily._allTransitiveDependencies,
        );

  final int maintainLoseGain;

  @override
  bool operator ==(Object other) {
    return other is PersonalizedPlansProvider &&
        other.maintainLoseGain == maintainLoseGain;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, maintainLoseGain.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
