import 'dart:convert';

import 'package:dio/dio.dart';

import 'datasource/driver_model.dart';
class ApiService {
  final dio = Dio();
  Future<DriverModel> fetchDriverData(String? query) async {
    Response response;
    var headerMap= {
      "Accept": "application/json",
      "content-type": "application/json",
      'token': 'ff74fab9-e1cb-4381-8f54-8fb5a7b42757',
      'User-Agent':'android',
      'ngrok-skip-browser-warning':'32232'
    };
    String url = query == null ? "https://wheelseye.com/driver?pageNo=0&size=20" : "https://wheelseye.com/driver?pageNo=0&size=20&name=${query}";
    response = await dio.get(url, options: Options(headers: headerMap));
    return DriverModel.fromJson(response.data);
  }

  Future<DriverModel> addDriver(
      String? name, String? number, String? licenceNumber) async {
    Response response;
    var headerMap = {
      "Accept": "application/json",
      "content-type": "application/json",
      'token': 'ff74fab9-e1cb-4381-8f54-8fb5a7b42757',
    };

    var params = {
      "driverName": name,
      "phoneNumber": number,
      "licenseExpiry":'',
      "operatorId":'2'
    };
    String url = "https://wheelseye.com/driver/createOrUpdate";
    response = await dio.post(url,
        options: Options(headers: headerMap), data: params);
    return DriverModel.fromJson(response.data);
  }
}