// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labels.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Labels)
final labelsProvider = LabelsProvider._();

final class LabelsProvider extends $NotifierProvider<Labels, List<Label>> {
  LabelsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'labelsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$labelsHash();

  @$internal
  @override
  Labels create() => Labels();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Label> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Label>>(value),
    );
  }
}

String _$labelsHash() => r'9091f204b0ce557828895542029aed9276086c2d';

abstract class _$Labels extends $Notifier<List<Label>> {
  List<Label> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Label>, List<Label>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Label>, List<Label>>,
              List<Label>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
