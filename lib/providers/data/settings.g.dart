// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Settings)
final settingsProvider = SettingsProvider._();

final class SettingsProvider extends $NotifierProvider<Settings, Config> {
  SettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsHash();

  @$internal
  @override
  Settings create() => Settings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Config value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Config>(value),
    );
  }
}

String _$settingsHash() => r'3042bc811ef23c1bcd9e6b8ab62a1cafb4467005';

abstract class _$Settings extends $Notifier<Config> {
  Config build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Config, Config>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Config, Config>,
              Config,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
