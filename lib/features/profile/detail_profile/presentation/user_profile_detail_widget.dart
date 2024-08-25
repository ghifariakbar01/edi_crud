import 'package:flutter/material.dart';

import '../../../../shared/user/application/user.dart';
import '../../../../style/style.dart';

class UserProfileDetailWidget extends StatelessWidget {
  const UserProfileDetailWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Palette.greyDisabled.withOpacity(0.125),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'User Data',
            style: Themes.customColor(15, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID : ${user.id}',
                style: Themes.customColor(14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama : ${user.nama}',
                style: Themes.customColor(14, fontWeight: FontWeight.w500),
              ),
              Text(
                'Email : ${user.email}',
                style: Themes.customColor(14, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
