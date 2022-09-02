import 'package:flutter/material.dart';
import 'package:mvvm/data_helper/remote/dio_helper.dart';

import 'view/movie_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

