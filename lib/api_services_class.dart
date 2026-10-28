//create a abstarct class because where we use it then we implement its function override
import 'dart:convert';

import 'package:http/http.dart' as http;

//make a extension to check the status of api 
extension StatusCheck on http.Response{
  bool isScusses() => statusCode >= 200 && statusCode < 300;
}
abstract class ApiServicesClass {
  //base url
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  //api url
  String get apiUrl;

  //concatenate api url with base url
  String get url => '$baseUrl/$apiUrl';

  //create future function for fetch data from server
  Future<List> fetch({String apiEndPoint = ''}) async {
    final respose = await http.get(Uri.parse('$url/$apiEndPoint'));
    if(respose.isScusses()){
      return jsonDecode(respose.body);
    }else{
      throw Exception('Failed to load $apiUrl');
    }
  }

  //create a future to post the data to server
  Future <bool> insert(Map<String,dynamic> data) async{
    final response = await http.post(Uri.parse(url),body: data);
    return response.isScusses();
  }
}
