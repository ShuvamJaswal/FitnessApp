// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$planDetailsHash() => r'555d0d4cf7c2bf598fc8dcfa938133da3e634f21';

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

typedef PlanDetailsRef = AutoDisposeFutureProviderRef<PlanDetailsModel>;

/// See also [planDetails].
@ProviderFor(planDetails)
const planDetailsProvider = PlanDetailsFamily();

/// See also [planDetails].
class PlanDetailsFamily extends Family<AsyncValue<PlanDetailsModel>> {
  /// See also [planDetails].
  const PlanDetailsFamily();

  /// See also [planDetails].
  PlanDetailsProvider call({
    required String planUrl,
  }) {
    return PlanDetailsProvider(
      planUrl: planUrl,
    );
  }

  @override
  PlanDetailsProvider getProviderOverride(
    covariant PlanDetailsProvider provider,
  ) {
    return call(
      planUrl: provider.planUrl,
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
  String? get name => r'planDetailsProvider';
}

/// See also [planDetails].
class PlanDetailsProvider extends AutoDisposeFutureProvider<PlanDetailsModel> {
  /// See also [planDetails].
  PlanDetailsProvider({
    required this.planUrl,
  }) : super.internal(
          (ref) => planDetails(
            ref,
            planUrl: planUrl,
          ),
          from: planDetailsProvider,
          name: r'planDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$planDetailsHash,
          dependencies: PlanDetailsFamily._dependencies,
          allTransitiveDependencies:
              PlanDetailsFamily._allTransitiveDependencies,
        );

  final String planUrl;

  @override
  bool operator ==(Object other) {
    return other is PlanDetailsProvider && other.planUrl == planUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, planUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
