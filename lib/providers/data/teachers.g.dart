// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teachers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Teachers)
final teachersProvider = TeachersProvider._();

final class TeachersProvider
    extends $NotifierProvider<Teachers, List<Teacher>> {
  TeachersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'teachersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$teachersHash();

  @$internal
  @override
  Teachers create() => Teachers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Teacher> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Teacher>>(value),
    );
  }
}

String _$teachersHash() => r'b81f943d0347ee82c5e42dfa57f81845f9cda5dd';

abstract class _$Teachers extends $Notifier<List<Teacher>> {
  List<Teacher> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Teacher>, List<Teacher>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Teacher>, List<Teacher>>,
              List<Teacher>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
