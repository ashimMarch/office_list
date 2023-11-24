
import 'dart:convert';

import 'package:bank_genie_task/core/errors/exceptions.dart';
import 'package:bank_genie_task/core/utils/type_def.dart';
import 'package:bank_genie_task/data/auth/model/authentication_data.dart';
import 'package:bank_genie_task/data/office/model/office_data_model.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:http/http.dart';

abstract class OfficeRemoteDataSrc {
  const OfficeRemoteDataSrc();
  Future<Iterable<OfficeDataModel>> getOfficeList();
}

const _officeList = 'http://banqindev.eastus.cloudapp.azure.com:8080/banqin-provider/api/v1/offices';

class OfficeRemoteDataSrcImpl implements OfficeRemoteDataSrc {
  const OfficeRemoteDataSrcImpl(this._client);
  final  Client _client;
  
  @override
  Future<Iterable<OfficeDataModel>> getOfficeList() async {
    final headers = {
      'Authorization': 'Basic ${AuthenticationData.instance.key!}',
      'Banqin-Platform-TenantId': 'demo',
    };

    try {
      final response = await _client.get(
        Uri.parse(_officeList),
        headers: headers,
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        debugPrint(' ==getOfficeList: ERROR RESPONSE ${response.statusCode} ${response.body}=== ');
        throw ServerException(
          message: data['errorResponse']['developerMessage'], 
          statusCode: response.statusCode,
        );
      }
      final offices = (data as List).map((e) => e as DataMap).map((e) => OfficeDataModel.fromMap(e),);
      return offices;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(' $s ');
      debugPrint(' ======= OfficeRemoteDataSrcImpl getOfficeList: $e ======= ');
      throw const ServerException(
        message: 'Something went wrong,', 
        statusCode: 500,
      );
    }
  }
}

