import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:http/http.dart';

import '../config/api.dart';
import '../model/user.dart';

class FollowSource {
  static Future<bool> checkIsFollowing(
    String fromIdUser,
    String toIdUser,
  ) async {
    String url = '${Api.follow}/check.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow Source - checkIsFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Follow Source - checkIsFollowing', e.toString());
      return false;
    }
  }

  static Future<bool> following(String fromIdUser, String toIdUser) async {
    String url = '${Api.follow}/following.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow Source - following', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Follow Source - following', e.toString());
      return false;
    }
  }

  static Future<bool> noFollowing(String fromIdUser, String toIdUser) async {
    String url = '${Api.follow}/no_following.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow Source - noFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('Follow Source - noFollowing', e.toString());
      return false;
    }
  }

  static Future<List<User>> readFollower(String idUser) async {
    String url = '${Api.follow}/read_follower.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('Follow Source - readFollower', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return User.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle('Follow Source - readFollower', e.toString());
      return [];
    }
  }

  static Future<List<User>> readFollowing(String idUser) async {
    String url = '${Api.follow}/read_following.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('Follow Source - readFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return User.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle('Follow Source - readFollowing', e.toString());
      return [];
    }
  }
}
