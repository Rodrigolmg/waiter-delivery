import 'package:flutter/material.dart';
import 'package:waiter_delivery/util/http_client.dart';

abstract class Service<T> {

  List<T> modelList = [];

  Future<dynamic> get(String url) async {
    HttpClient httpClient = HttpClient(
      url: url,
      onSuccess: onSuccess,
      onFail: onFail,
    );

    await httpClient.get();

    return modelList;
  }

  Future<dynamic> getFacebookLogin() async {
    HttpClient httpClient = HttpClient();
    final profile = await httpClient.getFBLogin();
    return profile;
  }

  onFail(var response){
    modelList = [];
  }

  @protected
  onSuccess(var response);
}