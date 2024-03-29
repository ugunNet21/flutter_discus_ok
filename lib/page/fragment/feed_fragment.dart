import 'dart:convert';

import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/c_feed.dart';
import '../../controller/c_user.dart';
import '../../model/topic.dart';
import '../../widget/item_topic.dart';

class FeedFragment extends StatelessWidget {
  const FeedFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final cUser = context.read<CUser>();
    if(cUser.data==null) return DView.loadingCircle();
    context.read<CFeed>().setTopisc(cUser.data!.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: DView.textTitle('Feed', size: 24),
        ),
        Expanded(child: Consumer<CFeed>(
          builder: (contextConsumer, _, child) {
            if (_.topics.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DView.empty(),
                  DView.empty('Or you ar not following anybody'),
                ],
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: _.topics.length,
              itemBuilder: (context, index) {
                Topic topic = _.topics[index];
                List images = jsonDecode(topic.images);
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    8,
                    16,
                    index == _.topics.length - 1 ? 30 : 8,
                  ),
                  child: ItemTopic(topic: topic, images: images),
                );
              },
            );
          },
        )),
      ],
    );
  }
}
