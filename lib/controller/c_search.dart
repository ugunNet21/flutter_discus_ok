import 'package:flutter/foundation.dart';

import '../model/topic.dart';
import '../model/user.dart';
import '../source/topic_source.dart';
import '../source/user_source.dart';

class CSearch extends ChangeNotifier {
  List<String> get filters => ['Topic','User'];

  String _filter = 'Topic';
  String get filter => _filter;
  set filter(String newFilter) {
    _filter = newFilter;
    notifyListeners();
  }

  search(String query) {
    if(filter=='Topic') {
      setTopisc(query);
    }else{
      setUsers(query);
    }
  }

  List<Topic> _topics = [];
  List<Topic> get topics => _topics;
  setTopisc(String query) async {
    _topics = await TopicSource.search(query);
    notifyListeners();
  }

  List<User> _users = [];
  List<User> get users => _users;
  setUsers(String query) async {
    _users = await UserSource.search(query);
    notifyListeners();
  }
}