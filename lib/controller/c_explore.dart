import 'package:flutter/foundation.dart';

import '../model/topic.dart';
import '../source/topic_source.dart';

class CExplore extends ChangeNotifier {
  List<Topic> _topics = [];
  List<Topic> get topics => _topics;
  setTopisc() async {
    _topics = await TopicSource.readExplore();
    notifyListeners();
  }
}
