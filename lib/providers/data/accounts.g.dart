// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Accounts)
final accountsProvider = AccountsProvider._();

final class AccountsProvider extends $NotifierProvider<Accounts, Account> {
  AccountsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountsHash();

  @$internal
  @override
  Accounts create() => Accounts();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Account value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Account>(value),
    );
  }
}

String _$accountsHash() => r'57752f80e53548d9b60ec348645696a250661533';

abstract class _$Accounts extends $Notifier<Account> {
  Account build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Account, Account>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Account, Account>,
              Account,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
