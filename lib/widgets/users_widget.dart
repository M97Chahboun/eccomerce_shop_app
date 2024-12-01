import 'package:eccomerce_shop_app/consts/api_consts.dart';
import 'package:eccomerce_shop_app/models/users_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rocket/flutter_rocket.dart';

import '../consts/global_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final usersModelRocket = Rocket.get<UsersModel>(rocketUsersKey);
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: usersModelRocket.avatar.toString(),
        boxFit: BoxFit.fill,
      ),
      title: Text(usersModelRocket.name.toString()),
      subtitle: Text(usersModelRocket.email.toString()),
      trailing: Text(
        usersModelRocket.role.toString(),
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
