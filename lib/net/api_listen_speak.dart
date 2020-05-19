import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/net/api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'http://testuser.english-pal.com/';
    interceptors.add(ApiIntercept());
  }
}

class ApiIntercept extends InterceptorsWrapper {
  ///对请求的处理做包装
  @override
  onRequest(RequestOptions options) async {
    print('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
    return options;
  }

  ///对响应做处理
  @override
  onResponse(Response response) async {
    ResponseData resData = ResponseData.fromJson(jsonDecode(response.data));
    if (resData.isSuccess) {
      return http.resolve(resData);
    } else {
      return handleFailed(resData);
    }
  }

  Future<Response> handleFailed(ResponseData resData) {
    print('---api-response--->error---->$resData');
    return http.reject(resData.description);
  }
}

class ResponseData {
  dynamic result;
  String code;
  String description;
  bool encrypt;
  String systemId;
  num systemTime;
  bool success;

  bool get isSuccess =>'0000'==code;

  ResponseData(this.result, this.code, this.description,
      {this.encrypt, this.systemId, this.systemTime, this.success});

  @override
  String toString() {
    return 'ResponseData{result: $result, code: $code, description: $description,encrypt: $encrypt,systemId: $systemId,systemTime: $systemTime,success: $success}';
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['result'] = result;
    data['code'] = code;
    data['description'] = description;
    data['encrypt'] = encrypt;
    data['systemId'] = systemId;
    data['systemTime'] = systemTime;
    data['success'] = success;
    return <String, dynamic>{
      'result': result,
      'code': code,
      'description': description,
      'encrypt': encrypt,
      'systemId': systemId,
      'systemTime': systemTime,
      'success': success
    };
  }

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(json['result'], json['code'], json['description'],
        encrypt: json['encrypt'] ?? null,
        systemId: json['systemId'] ?? null,
        systemTime: json['systemTime'] ?? null,
        success: json['success'] ?? null);
  }
}
