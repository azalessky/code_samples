// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Lessons)
final lessonsProvider = LessonsProvider._();

final class LessonsProvider extends $NotifierProvider<Lessons, List<Lesson>> {
  LessonsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lessonsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lessonsHash();

  @$internal
  @override
  Lessons create() => Lessons();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Lesson> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Lesson>>(value),
    );
  }
}

String _$lessonsHash() => r'3feac6df39e85b4a47fda88838d2bd39fd3415d9';

abstract class _$Lessons extends $Notifier<List<Lesson>> {
  List<Lesson> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Lesson>, List<Lesson>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Lesson>, List<Lesson>>,
              List<Lesson>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
