import 'dart:io';

import 'package:flutter_amazon/Enum/Enum.dart';
import 'package:flutter_amazon/entity/loginEntity.dart';
import 'package:flutter_amazon/ui/Dashboard/HomeUI.dart';
import 'package:flutter_amazon/utils/ExtendFun.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';



Future<Album> fetchAlbum() async {
  
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

void fetchAlbum2(String endPoint, Map request, {required Null Function(Api type, Album? entity, String? timeout) api}) async {
  try{
  bool result = await InternetConnection().hasInternetAccess;
    Logger("fetchAlbum2").log(result.toString());
    api(Api.connection, null, "internet is connected $result");
    if(result){
        api(Api.loading, null, null);
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'))
           .timeout(
              const Duration(seconds: 1),
               onTimeout: () {
                api(Api.timeout, null, "Timeout");
                return http.Response('Error', 408);
                },
            );
        if (response.statusCode == 200) {
              var entity =  Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
              api(Api.success, entity, null);
        } else {
            api(Api.failure, null, "Something went wrong");
        }
    } else {
            api(Api.connection, null, null);
    }
  } on Exception catch (error) {
      api(Api.failure, null, "Something went wrong $error");
    }
}