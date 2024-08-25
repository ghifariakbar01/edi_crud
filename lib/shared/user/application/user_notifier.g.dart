// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userStorageHash() => r'792e296b358dce26a2dc81ded2adebaabc074310';

/// See also [userStorage].
@ProviderFor(userStorage)
final userStorageProvider = Provider<UserStorage>.internal(
  userStorage,
  name: r'userStorageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserStorageRef = ProviderRef<UserStorage>;
String _$userRepositoryHash() => r'f228791097405e92a6168f3c684b113920b807ec';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = Provider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = ProviderRef<UserRepository>;
String _$usersNotifierHash() => r'430017b8a48de0ff6cdb6f49a52c2c37a7cfb9f7';

/// See also [UsersNotifier].
@ProviderFor(UsersNotifier)
final usersNotifierProvider =
    AutoDisposeAsyncNotifierProvider<UsersNotifier, List<User>>.internal(
  UsersNotifier.new,
  name: r'usersNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usersNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UsersNotifier = AutoDisposeAsyncNotifier<List<User>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
