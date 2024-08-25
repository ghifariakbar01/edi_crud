// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_profile_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$detailProfileStorageHash() =>
    r'81aefe82b166e34e4c6dd2c2fd22f1b522e547b0';

/// See also [detailProfileStorage].
@ProviderFor(detailProfileStorage)
final detailProfileStorageProvider = Provider<DetailProfileStorage>.internal(
  detailProfileStorage,
  name: r'detailProfileStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$detailProfileStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DetailProfileStorageRef = ProviderRef<DetailProfileStorage>;
String _$detailProfileRepositoryHash() =>
    r'eaed44ccdc53ce74ad9b52349dbd8847380d96a4';

/// See also [detailProfileRepository].
@ProviderFor(detailProfileRepository)
final detailProfileRepositoryProvider = Provider<DetailRepository>.internal(
  detailProfileRepository,
  name: r'detailProfileRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$detailProfileRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DetailProfileRepositoryRef = ProviderRef<DetailRepository>;
String _$detailProfileNotifierHash() =>
    r'78e89c6e73785f98e8855af3c5b275e5227af949';

/// See also [DetailProfileNotifier].
@ProviderFor(DetailProfileNotifier)
final detailProfileNotifierProvider = AutoDisposeAsyncNotifierProvider<
    DetailProfileNotifier, DetailProfile>.internal(
  DetailProfileNotifier.new,
  name: r'detailProfileNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$detailProfileNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DetailProfileNotifier = AutoDisposeAsyncNotifier<DetailProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
