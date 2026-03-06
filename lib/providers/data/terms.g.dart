// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Terms)
final termsProvider = TermsProvider._();

final class TermsProvider extends $NotifierProvider<Terms, List<Term>> {
  TermsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'termsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$termsHash();

  @$internal
  @override
  Terms create() => Terms();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Term> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Term>>(value),
    );
  }
}

String _$termsHash() => r'f8805e25b6c4889e1092ce4a09ce784efbfcda01';

abstract class _$Terms extends $Notifier<List<Term>> {
  List<Term> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Term>, List<Term>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Term>, List<Term>>,
              List<Term>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
