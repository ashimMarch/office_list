
import 'dart:convert';

import 'package:bank_genie_task/core/errors/exceptions.dart';
import 'package:bank_genie_task/core/utils/type_def.dart';
import 'package:bank_genie_task/data/auth/model/authentication_data.dart';
import 'package:bank_genie_task/data/auth/model/user_data_model.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:http/http.dart';

abstract class AuthRemoteSrc {
  const AuthRemoteSrc();

  Future<UserDataModel> signIn({
    required String username,
    required String password,
  });
}

const _signInUrl = 'http://banqindev.eastus.cloudapp.azure.com:8080/banqin-provider/api/v1/authentication';
const _authKey = 'base64EncodedAuthenticationKey';

class AuthRemoteSrcImpl implements AuthRemoteSrc{
  const AuthRemoteSrcImpl(this._client);
  final  Client _client;

  @override
  Future<UserDataModel> signIn({required String username, required String password}) async {
    final body = {
      'username': username,
      'password': password,
    };
    final headers = {
      'Content-Type': 'application/json',
      'Banqin-Platform-TenantId': 'demo',
    };

    try {
      final response = await _client.post(
        Uri.parse(_signInUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      final data = jsonDecode(response.body) as DataMap;

      if (response.statusCode != 200) {
        debugPrint(' ==signIn: ERROR RESPONSE ${response.statusCode} ${response.body}=== ');
        throw ServerException(
          message: data['errorResponse']['developerMessage'], 
          statusCode: response.statusCode,
        );
      }

      AuthenticationData.instance.setKey = data[_authKey];
      return UserDataModel.fromMap(data);
    } on ServerException {
      rethrow;
    } catch (e) {
      debugPrint(' ======= AuthRemoteSrcImpl signIn: $e ======= ');
      throw const ServerException(
        message: 'Something went wrong, Please try again!', 
        statusCode: 500,
      );
    }
  }
}