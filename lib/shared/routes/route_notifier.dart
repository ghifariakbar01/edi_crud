import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/create/presentation/create_user_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/profile/detail_profile/presentation/detail_profile_page.dart';
import '../../features/signin/presentation/sign_in_page.dart';
import '../../features/signup/presentation/sign_up_page.dart';
import '../user/application/user.dart';
import 'route_names.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier() {}

  String? redirectLogic(BuildContext context, GoRouterState state) {
    if (state.matchedLocation == RouteNames.signInRoute ||
        state.matchedLocation == RouteNames.signUpRoute) {
      return null;
    } else {
      return RouteNames.signInRoute;
    }
  }

  String? onAuthenticated(BuildContext context, GoRouterState state) {
    if (state.matchedLocation == RouteNames.defaultRoute) {
      return RouteNames.homeRoute;
    } else {
      return null;
    }
  }

  List<GoRoute> get routes {
    return [
      GoRoute(
        name: RouteNames.defaultNameRoute,
        path: RouteNames.defaultRoute,
        builder: (context, state) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text('Default'))),
      ),
      GoRoute(
          name: RouteNames.homeNameRoute,
          path: RouteNames.homeRoute,
          builder: (context, state) => const HomePage()),
      GoRoute(
        name: RouteNames.signInNameRoute,
        path: RouteNames.signInRoute,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        name: RouteNames.signUpNameRoute,
        path: RouteNames.signUpRoute,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: RouteNames.detailProfileNameRoute,
        path: RouteNames.detailProfileRoute,
        builder: (context, state) {
          final json = state.extra as Map<String, dynamic>;
          final user = User.fromJson(json);

          return DetailProfilePage(user);
        },
      ),
      GoRoute(
          name: RouteNames.createUserNameRoute,
          path: RouteNames.createUserRoute,
          builder: (context, state) => CreateUserPage()),
    ];
  }
}
