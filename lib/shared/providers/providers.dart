import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../routes/route_notifier.dart';

final routerProvider = StateProvider<GoRouter>((ref) {
  final router = RouterNotifier();
  return GoRouter(
    refreshListenable: router,
    redirect: router.redirectLogic,
    routes: router.routes,
  );
});
