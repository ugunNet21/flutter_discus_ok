


import 'package:flutter/foundation.dart';

import '../model/user.dart';

class CUser extends ChangeNotifier {
  User? _data;
  User? get data => _data;
  set data(User? n) {
    _data = n;
    notifyListeners();
  }
}