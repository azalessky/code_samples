// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'periods.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Periods)
final periodsProvider = PeriodsProvider._();

final class PeriodsProvider extends $NotifierProvider<Periods, List<Period>> {
  PeriodsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'periodsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$periodsHash();

  @$internal
  @override
  Periods create() => Periods();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Period> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Period>>(value),
    );
  }
}

String _$periodsHash() => r'a0ef8e4738a4affe92668dc0cfc6032c88b8c9ef';

abstract class _$Periods extends $Notifier<List<Period>> {
  List<Period> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Period>, List<Period>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Period>, List<Period>>,
              List<Period>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
