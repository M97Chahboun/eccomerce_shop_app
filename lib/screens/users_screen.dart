import 'package:flutter/material.dart';
import 'package:mvc_rocket/mvc_rocket.dart';

import '../consts/api_consts.dart';
import '../models/users_model.dart';
import '../widgets/rocket_error.dart';
import '../widgets/users_widget.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);
  final UsersModel users = UsersModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: RocketView(
          onError: (error, reload) {
            return RocketErrorView(
              reload: reload,
              error: error,
            );
          },
          model: users,
          call: () {
            Rocket.get<RocketRequest>(rocketRequestKey).request(
              "users",
              model: users,
            );
          },
          builder: (context) {
            return ListView.builder(
                itemCount: users.all!.length,
                itemBuilder: (ctx, index) {
                  Rocket.add<UsersModel>(rocketUsersKey, users.all![index]);
                  return const UsersWidget();
                });
          }),
    );
  }
}
