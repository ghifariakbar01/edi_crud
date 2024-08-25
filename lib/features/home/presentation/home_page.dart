import 'package:edi_crud/features/signout/application/sign_out_notifier.dart';
import 'package:edi_crud/shared/auth/application/auth_notifier.dart';
import 'package:edi_crud/shared/user/application/user_controller.dart';
import 'package:edi_crud/shared/user/application/user_notifier.dart';
import 'package:edi_crud/shared/widgets/v_async_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/routes/route_names.dart';
import '../../../shared/utils/alert_helper.dart';
import '../../../shared/utils/dialog_helper.dart';
import '../../../style/style.dart';
import "package:edi_crud/features/home/presentation/user_item_widget.dart";

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<int>>(signOutNotifierProvider, (_, state) async {
      if (!state.isLoading &&
          state.hasValue &&
          state.value != null &&
          state.value != '' &&
          state.hasError == false) {
        final rows = state.requireValue;
        if (rows == 0) {
          return;
        }

        return AlertHelper.showSnackBar(context,
            message: 'Logout Berhasil',
            onDone: ref
                .read(authNotifierProvider.notifier)
                .checkAndUpdateAuthStatus);
      } else {
        if (state.hasError) {
          return DialogHelper.showCustomDialog(
            context,
            state.error.toString(),
          );
        }
      }
    });

    ref.listen<AsyncValue<int>>(userControllerProvider, (_, state) async {
      if (!state.isLoading &&
          state.hasValue &&
          state.value != null &&
          state.value != '' &&
          state.hasError == false) {
        final rows = state.requireValue;
        if (rows == 0) {
          return;
        }

        return AlertHelper.showSnackBar(context,
            message: '$rows rows affected',
            onDone: ref.read(usersNotifierProvider.notifier).getAllUser);
      } else {
        if (state.hasError) {
          return DialogHelper.showCustomDialog(
            context,
            state.error.toString(),
          );
        }
      }
    });

    final isSearching = useState(false);

    final userNotifier = ref.watch(usersNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: isSearching.value
              ? TextFormField(
                  decoration: Themes.formStyle('Search By Nama'),
                  onTapOutside: (_) => isSearching.value = false,
                  onChanged: (value) async {
                    if (value.isEmpty) {
                      return ref
                          .read(usersNotifierProvider.notifier)
                          .getAllUser();
                    }
                  },
                  onFieldSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      return ref
                          .read(usersNotifierProvider.notifier)
                          .searchUser(nama: value);
                    }
                  },
                )
              : IconButton(
                  onPressed: () => isSearching.value == true
                      ? isSearching.value = false
                      : isSearching.value = true,
                  icon: Icon(Icons.search),
                ),
          actions: [
            IconButton(
              onPressed: () async {
                return DialogHelper.showConfirmationDialog(
                    label: 'Logout ?',
                    context: context,
                    onPressed: () async {
                      context.pop();
                      return ref
                          .read(signOutNotifierProvider.notifier)
                          .signOut();
                    });
              },
              icon: Icon(Icons.login),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => context.pushNamed(
                  RouteNames.createUserRoute,
                )),
        body: InkWell(
          onTap: () =>
              isSearching.value == true ? isSearching.value = false : () {},
          child: VAsyncValueWidget(
            value: userNotifier,
            data: (users) => users.isEmpty
                ? Center(
                    child: Text('Belum ada list user '),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return UserItemWidget(user: user);
                    },
                    itemCount: users.length,
                    separatorBuilder: (_, __) => Container(),
                  ),
          ),
        ));
  }
}
