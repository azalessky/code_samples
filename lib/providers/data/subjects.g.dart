// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Subjects)
final subjectsProvider = SubjectsProvider._();

final class SubjectsProvider
    extends $NotifierProvider<Subjects, List<Subject>> {
  SubjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subjectsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subjectsHash();

  @$internal
  @override
  Subjects create() => Subjects();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Subject> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Subject>>(value),
    );
  }
}

String _$subjectsHash() => r'f14242d0bf3aa7f7f3f99663c2795c7318611b9d';

abstract class _$Subjects extends $Notifier<List<Subject>> {
  List<Subject> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Subject>, List<Subject>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Subject>, List<Subject>>,
              List<Subject>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
