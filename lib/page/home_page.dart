import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../config/app_route.dart';
import '../controller/c_home.dart';
import 'fragment/account_fragment.dart';
import 'fragment/explore_fragment.dart';
import 'fragment/feed_fragment.dart';
import 'fragment/my_topic_fragment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List menu = [
      {
        'icon': Icons.feed,
        'label': 'Feed',
        'view': const FeedFragment(),
      },
      {
        'icon': Icons.public,
        'label': 'Explore',
        'view': const ExploreFragment(),
      },
      {
        'icon': Icons.library_books,
        'label': 'Feed',
        'view': const MyTopicFragment(),
      },
      {
        'icon': Icons.account_circle,
        'label': 'Feed',
        'view': const AccountFragment(),
      },
    ];
    return Consumer<CHome>(builder: (context, _, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: menu[_.indexMenu]['view'],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            context.push(AppRoute.addTopic);
          },
          mini: true,
          tooltip: 'Create New Topic',
          child: const Icon(Icons.create),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _.indexMenu,
          onTap: (newIndex) {
            _.indexMenu = newIndex;
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: menu.map((e) {
            return BottomNavigationBarItem(
              icon: Icon(e['icon']),
              label: e['label'],
            );
          }).toList(),
        ),
      );
    });
  }
}