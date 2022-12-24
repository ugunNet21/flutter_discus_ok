import 'package:flutter/foundation.dart';

import '../model/topic.dart';
import '../source/topic_source.dart';

class CMyTopic extends ChangeNotifier {
  List<Topic> _topics = [];
  List<Topic> get topics => _topics;
  setTopisc(String idUser) async {
    _topics = await TopicSource.readWhereIdUser(idUser);
    notifyListeners();
  }
}
