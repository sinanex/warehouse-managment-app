import 'dart:developer';

import 'package:dio/dio.dart';

class AuthServices {
  Dio dio = Dio();
    void registerUser({required String name,required String email,required String password})async{
      log('register.....');
     try {
        final response = await dio.post('http://localhost:9000/users/register',data: {
        'name':name,
        'email':email,
        'password':password
      });
      log(response.statusCode.toString());
  

     }on DioException catch (e) {
      if(e.response?.statusCode ==400){
        log(e.response!.data.toString());
        log(e.message??'messgae');
      }else{
        log('error');
      }
     }
    } 
}