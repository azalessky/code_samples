// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bells.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Bells)
final bellsProvider = BellsProvider._();

final class BellsProvider extends $NotifierProvider<Bells, List<Bell>> {
  BellsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bellsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bellsHash();

  @$internal
  @override
  Bells create() => Bells();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Bell> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Bell>>(value),
    );
  }
}

String _$bellsHash() => r'bf7f54f506ded901262c14fedbb0b2a1128a6274';

abstract class _$Bells extends $Notifier<List<Bell>> {
  List<Bell> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Bell>, List<Bell>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Bell>, List<Bell>>,
              List<Bell>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
