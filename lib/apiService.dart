import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService with ChangeNotifier {
  final url = 'http://144.91.124.145:9001/api/';
  var dio = Dio();

  Future<Map<String, dynamic>> getCall(slug) async {
    try {
      log('${url}${slug}');
      var response = await dio.get('${url}${slug}');
      if (response.statusCode == 200) {
        Map<String, dynamic> json = response.data;
        return json;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postCall(slug, data) async {
    try {
      log('url ${url}${slug}, data : $data ');
      var formData = FormData.fromMap(data);
      var response = await dio.post('${url}${slug}', data: formData);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = response.data;
        return json;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> patchCall(slug, data) async {
    try {
      log('url ${url}${slug}, data : $data ');
      var formData = FormData.fromMap(data);
      var response = await dio.patch('${url}${slug}', data: formData);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = response.data;
        return json;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> tokenWithPostCall(slug, token, data) async {
    try {
      var formData = FormData.fromMap(data);
      var response = await dio.post(
        '${url}${slug}',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // set content-length
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> json = response.data;
        return json;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> tokenWithGetCall(slug, token) async {
    try {
      var response = await dio.get(
        '${url}${slug}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // set content-length
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> json = response.data;
        return json;
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
