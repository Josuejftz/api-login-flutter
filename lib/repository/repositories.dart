import 'dart:convert';
import 'package:encuestas/model/users_model.dart';
import 'package:http/http.dart';

class UserRepository {
  
  String userUrl = 'http://10.0.2.2/api/users';

  String userUrl_login = 'http://10.0.2.2/api/login';
  //https://inventario.tierrafertil.pe/categories
  //String userUrl = 'https://reqres.in/api/users?page=2';
  //https://jacobsbrewery.com/carta/api/admin/categories

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];///['data']
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

   Future<UserModel> getData(String email,String password) async {
    Response response = await post(Uri.parse(userUrl_login), body: {
      "email": email,
      "password" :password,
      });

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['user'];///['data']
      print('desde repository');
      print(result);
      return UserModel.fromJson(result);
    } else {
      print('error_repository ${response.statusCode}');
      throw Exception(response.reasonPhrase);
    }
  }
}
