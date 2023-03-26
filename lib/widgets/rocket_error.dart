import 'package:flutter/material.dart';
import 'package:mvc_rocket/mvc_rocket.dart';

class RocketErrorView extends StatelessWidget {
  const RocketErrorView({
    super.key,
    required this.error,
    required this.reload,
  });
  final RocketException error;
  final VoidCallback reload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (error.statusCode != 0) Text('Status code : ${error.statusCode}'),
          if (error.response.isNotEmpty)
            Text("Api response : ${error.response}"),
          if (error.exception.isNotEmpty)
            Text('exception : ${error.exception}'),
          OutlinedButton(onPressed: reload, child: const Text("Retry"))
        ],
      ),
    );
  }
}
