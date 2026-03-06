// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grades.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Grades)
final gradesProvider = GradesProvider._();

final class GradesProvider extends $NotifierProvider<Grades, List<Grade>> {
  GradesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gradesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gradesHash();

  @$internal
  @override
  Grades create() => Grades();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Grade> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Grade>>(value),
    );
  }
}

String _$gradesHash() => r'320c8b0c561e2f4963b7c36b9e8a0cfb14f570e4';

abstract class _$Grades extends $Notifier<List<Grade>> {
  List<Grade> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Grade>, List<Grade>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Grade>, List<Grade>>,
              List<Grade>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
