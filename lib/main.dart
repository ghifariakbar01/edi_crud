import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import 'shared/auth/application/auth_notifier.dart';
import 'shared/auth/application/states/auth_state.dart';
import 'shared/providers/providers.dart';
import 'shared/widgets/v_async_widget.dart';
import 'style/style.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final initializationProvider = FutureProvider<Unit>((ref) async {
  // await clear();
  await ref.read(authNotifierProvider.notifier).checkAndUpdateAuthStatus();
  return unit;
});

clear() async {
  const _key = 'auth_db.db';
  return deleteDatabase(_key);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, __) {});

    final authNotifier = ref.watch(authNotifierProvider);

    return VAsyncWidgetScaffoldWrappedMaterial<AuthState>(
      value: authNotifier,
      data: (auth) => auth.maybeWhen(
        authenticated: () => MaterialApp.router(
          title: 'PT EDI CRUD Test - (Signed In) - Ghifari Akbar ',
          theme: Themes.theme(context),
          builder: (_, c) => c ?? Container(),
          routerDelegate: signedInRouter.routerDelegate,
          routeInformationProvider: signedInRouter.routeInformationProvider,
          routeInformationParser: signedInRouter.routeInformationParser,
        ),
        orElse: () => MaterialApp.router(
          title: 'PT EDI CRUD Test - Ghifari Akbar',
          theme: Themes.theme(context),
          builder: (_, c) => c ?? Container(),
          routerDelegate: initialRouter.routerDelegate,
          routeInformationProvider: initialRouter.routeInformationProvider,
          routeInformationParser: initialRouter.routeInformationParser,
        ),
      ),
    );
  }
}
