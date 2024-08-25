import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/user/application/user.dart';
import '../../../../shared/user/application/user_notifier.dart';
import '../../../../shared/utils/alert_helper.dart';
import '../../../../shared/utils/dialog_helper.dart';
import '../../../../shared/widgets/v_async_widget.dart';
import '../../../../style/style.dart';

import '../application/detail_profile_controller.dart';
import '../application/detail_profile_notifier.dart';
import 'detail_profile_form.dart';

class DetailProfilePage extends StatefulHookConsumerWidget {
  const DetailProfilePage(this.user, {super.key});

  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailProfilePageState();
}

class _DetailProfilePageState extends ConsumerState<DetailProfilePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      return ref
          .read(detailProfileNotifierProvider.notifier)
          .getUserDetailBy(id: widget.user.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<int>>(detailProfileControllerProvider,
        (_, state) async {
      if (!state.isLoading &&
          state.hasValue &&
          state.value != null &&
          state.value != '' &&
          state.hasError == false) {
        final rows = state.requireValue;
        if (rows == 0) {
          return;
        }

        return AlertHelper.showSnackBar(
          context,
          message: '$rows rows affected',
          color: Colors.green,
          onDone: () async {
            context.pop();
            return ref.read(usersNotifierProvider.notifier).getAllUser();
          },
        );
      } else {
        if (state.hasError) {
          return DialogHelper.showCustomDialog(
            context,
            state.error.toString(),
          );
        }
      }
    });

    final detail = ref.watch(detailProfileNotifierProvider);

    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(),
        body: VAsyncValueWidget(
          value: detail,
          data: (det) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Palette.greyDisabled.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DetailProfileForm(
                  det: det,
                  user: widget.user,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
