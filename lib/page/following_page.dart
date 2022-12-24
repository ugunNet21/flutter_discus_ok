import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/c_following.dart';
import '../model/user.dart';
import '../widget/item_user.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    context.read<CFollowing>().setList(user.id);
    return Scaffold(
      appBar: DView.appBarLeft("${user.username} following..."),
      body: Consumer<CFollowing>(
        builder: (contextConsumer, _, child) {
          if (_.list.isEmpty) return DView.empty();
          return ListView.builder(
            itemCount: _.list.length,
            itemBuilder: (context, index) {
              return ItemUser(user: _.list[index]);
            },
          );
        },
      ),
    );
  }
}