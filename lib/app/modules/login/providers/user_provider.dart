import 'package:get/get.dart';

import '../user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SingleUser.fromJson(map);
      if (map is List) return map.map((item) => SingleUser.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<SingleUser?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<Response<SingleUser>> postUser(SingleUser user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
