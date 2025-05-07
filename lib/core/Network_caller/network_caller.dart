import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/web.dart';

class Networkresponse {
  final int statuscode;
  final Map<String, dynamic>? responsedata;
  final bool issuccess;
  final String? errormessage;
  Networkresponse({
    required this.statuscode,
    required this.issuccess,
    this.errormessage = 'somethig worng',
    this.responsedata,
  });
}

class NetwokCaller {
  final Logger _logger = Logger();
  // here not using static in 23 line
  Future<Networkresponse> getrequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {'token': ''};

      _logrequest(url, headers);

      Response response = await get(uri, headers: headers);
      _logresponse(url, response);
      if (response.statusCode == 200||response.statusCode == 201) {
        final decodedata = jsonDecode(response.body);

        return Networkresponse(
          statuscode: response.statusCode,
          issuccess: true,
          responsedata: decodedata,
        );
      } else {
        return Networkresponse(
          statuscode: response.statusCode,
          issuccess: false,
        );
      }
    } catch (e) {
      return Networkresponse(statuscode: -1, issuccess: false);
    }
  }

  Future<Networkresponse> postrequest({required String url, Map<String, dynamic>? body, }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {'token': ''};
      _logrequest(url, headers);
      Response response = await post(
        uri,
        headers: {'content-type': 'application/json'},
        //body
        body: jsonEncode(body),
      );
      _logresponse(url, response);
       final decodedata = jsonDecode(response.body);
      if (response.statusCode == 200||response.statusCode == 201) {
        //response body
       

        return Networkresponse(
          statuscode: response.statusCode,
          issuccess: true,
          responsedata: decodedata,
          errormessage: decodedata['msg']
        );
      } else {
        return Networkresponse(
          statuscode: response.statusCode,
          issuccess: false,
        );
      }
    } catch (e) {
      return Networkresponse(statuscode: -1, issuccess: false);
    }
  }

  void _logrequest(String url, Map<String, dynamic> headers, {Map<String, dynamic>? requestbody,}) {
    _logger.i("url=>$url \n headers=>$headers,\n request=>$requestbody");
  }

  void _logresponse(String url, Response response) {
    _logger.i(
      "url=>$url\n statuscode=>${response.statusCode}\n body=>${response.body} ",
    );
  }
}
