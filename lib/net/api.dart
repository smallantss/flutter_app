
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

 _parseAndDecode(String response){
  return jsonDecode(response);
}

//解析Json数据
 parseJson(String text){
  return compute(_parseAndDecode,text);
}


///网络请求的类
abstract class BaseHttp extends DioForNative{

  BaseHttp(){
    //设置json解码的回调
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors.add(HeadIntercept());
    init();
  }

  void init();
}

class HeadIntercept extends InterceptorsWrapper{
  
  @override
  onRequest(RequestOptions options) async{
    // headers: <String, dynamic>{
    //     'Content-type': 'application/json;charset=utf-8',
    //     'device': 'a30184a06914bade',
    //     'systemId': '39android',
    //     'token': 'zdqjTeM7rw3iFm88e8ED',
    //     'encryptCode': '39android_36',
    //     'terminalType': 'Android',
    //     'Authorization': 'zdqjTeM7rw3iFm88e8ED'
    //   }
    options.connectTimeout = 1000*10;
    options.receiveTimeout = 1000*10;
    options.headers['Content-type'] = 'application/json;charset=utf-8';
    options.headers['device'] = 'a30184a06914bade';
    options.headers['systemId'] = '39android';
    options.headers['token'] = 'zdqjTeM7rw3iFm88e8ED';
    options.headers['encryptCode'] = '39android_36';
    options.headers['terminalType'] = 'Android';
    options.headers['Authorization'] = 'zdqjTeM7rw3iFm88e8ED';
    return options;
  }

  // @override
  // Future onResponse(Response response) {
  //   // TODO: implement onResponse
  //   return super.onResponse(response);
  // }
}

