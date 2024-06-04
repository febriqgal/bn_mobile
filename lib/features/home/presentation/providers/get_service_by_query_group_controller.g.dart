// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_by_query_group_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getServiceByQueryGroupHash() =>
    r'585072f7af534bca00da97907c315f61baa10706';

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

abstract class _$GetServiceByQueryGroup
    extends BuildlessAutoDisposeNotifier<List<Map<String, dynamic>>> {
  late final String group;

  List<Map<String, dynamic>> build(
    String group,
  );
}

/// See also [GetServiceByQueryGroup].
@ProviderFor(GetServiceByQueryGroup)
const getServiceByQueryGroupProvider = GetServiceByQueryGroupFamily();

/// See also [GetServiceByQueryGroup].
class GetServiceByQueryGroupFamily extends Family<List<Map<String, dynamic>>> {
  /// See also [GetServiceByQueryGroup].
  const GetServiceByQueryGroupFamily();

  /// See also [GetServiceByQueryGroup].
  GetServiceByQueryGroupProvider call(
    String group,
  ) {
    return GetServiceByQueryGroupProvider(
      group,
    );
  }

  @override
  GetServiceByQueryGroupProvider getProviderOverride(
    covariant GetServiceByQueryGroupProvider provider,
  ) {
    return call(
      provider.group,
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
  String? get name => r'getServiceByQueryGroupProvider';
}

/// See also [GetServiceByQueryGroup].
class GetServiceByQueryGroupProvider extends AutoDisposeNotifierProviderImpl<
    GetServiceByQueryGroup, List<Map<String, dynamic>>> {
  /// See also [GetServiceByQueryGroup].
  GetServiceByQueryGroupProvider(
    String group,
  ) : this._internal(
          () => GetServiceByQueryGroup()..group = group,
          from: getServiceByQueryGroupProvider,
          name: r'getServiceByQueryGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getServiceByQueryGroupHash,
          dependencies: GetServiceByQueryGroupFamily._dependencies,
          allTransitiveDependencies:
              GetServiceByQueryGroupFamily._allTransitiveDependencies,
          group: group,
        );

  GetServiceByQueryGroupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.group,
  }) : super.internal();

  final String group;

  @override
  List<Map<String, dynamic>> runNotifierBuild(
    covariant GetServiceByQueryGroup notifier,
  ) {
    return notifier.build(
      group,
    );
  }

  @override
  Override overrideWith(GetServiceByQueryGroup Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetServiceByQueryGroupProvider._internal(
        () => create()..group = group,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        group: group,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<GetServiceByQueryGroup,
      List<Map<String, dynamic>>> createElement() {
    return _GetServiceByQueryGroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetServiceByQueryGroupProvider && other.group == group;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, group.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetServiceByQueryGroupRef
    on AutoDisposeNotifierProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `group` of this provider.
  String get group;
}

class _GetServiceByQueryGroupProviderElement
    extends AutoDisposeNotifierProviderElement<GetServiceByQueryGroup,
        List<Map<String, dynamic>>> with GetServiceByQueryGroupRef {
  _GetServiceByQueryGroupProviderElement(super.provider);

  @override
  String get group => (origin as GetServiceByQueryGroupProvider).group;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
