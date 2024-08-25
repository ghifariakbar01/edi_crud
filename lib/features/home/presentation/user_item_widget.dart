import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/routes/route_names.dart';
import '../../../shared/user/application/user.dart';
import '../../../shared/user/application/user_controller.dart';
import '../../../shared/utils/dialog_helper.dart';
import '../../../shared/widgets/v_async_widget.dart';
import '../../../style/style.dart';
import '../../profile/profile/application/profile_notifier.dart';

class UserItemWidget extends ConsumerWidget {
  const UserItemWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileNotifier = ref.watch(profileNotifierProvider);

    return VAsyncValueWidget(
      value: profileNotifier,
      data: (profile) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Palette.greyDisabled.withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID : ${user.id}',
                    style: Themes.customColor(14, fontWeight: FontWeight.bold),
                  ),
                  Text('Nama : ${user.nama}'),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email : ${user.email}'),
                  Text('Password : ${user.password}'),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text('Admin : ${user.isAdmin == 1 ? 'Ya' : 'Bukan'}'),
              if (profile.isAdmin == 1)
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final status = user.isActive == 1 ? false : true;
                        return DialogHelper.showConfirmationDialog(
                            label:
                                'Ubah Status Ke ${status == true ? 'Aktif' : 'Tidak Aktif'} ?',
                            context: context,
                            onPressed: () async {
                              context.pop();
                              return ref
                                  .read(userControllerProvider.notifier)
                                  .changeUserStatus(
                                    user: user,
                                    status: status,
                                  );
                            });
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 8,
                              backgroundColor: user.isActive == 1
                                  ? Colors.green
                                  : Colors.red),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              '${user.isActive == 1 ? 'Aktif' : 'Tidak Aktif'}'),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () async {
                        return DialogHelper.showConfirmationDialog(
                            label: 'Delete User ?',
                            context: context,
                            onPressed: () async {
                              context.pop();
                              return ref
                                  .read(userControllerProvider.notifier)
                                  .deleteUser(id: user.id);
                            });
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () async {
                        await context.pushNamed(
                          RouteNames.detailProfileRoute,
                          extra: user.toJson(),
                        );
                      },
                      icon: Icon(Icons.edit),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
