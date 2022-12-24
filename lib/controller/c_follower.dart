import 'package:flutter/foundation.dart';

import '../model/user.dart';
import '../source/follow_source.dart';

class CFollower extends ChangeNotifier {
  List<User> _list = [];
  List<User> get list => _list;
  setList(String idUser) async {
    _list = await FollowSource.readFollower(idUser);
    notifyListeners();
  }
}
