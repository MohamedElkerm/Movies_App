import 'package:dio/dio.dart';
import 'package:mvvm/constatnts.dart';

class DioHelper{
  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        headers:{
          'X-RapidAPI-Key' : 'e799d42002msh79d589cd4c3c41fp1eda5ejsnb2da5ca5315b' ,
          'X-RapidAPI-Host' : 'motivational-quotes1.p.rapidapi.com' ,
        } ,
      )
    );
  }

  static Future<Response> getData(path,query)async{
    return await dio!.get(
      path,
      queryParameters: query,
    );

  }

  static postData(path,query)async{
    return await dio!.post(
        path,
      queryParameters: query,
    );
  }

}