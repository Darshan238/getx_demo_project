

import 'package:dio/dio.dart';
import 'package:getx_project_demo/api_g.dart';

import 'my_dao.dart';
import 'app_database.dart';

class DB {
  static final DB _db = DB._internal();
  late AppDatabase database;
  late MyDao dao;
  late RestClient apiMethod;
  // late User prefdata;

  factory DB() {
    return _db;
  }

  DB._internal() {
    builder();
    dio();
    // pref();
  }

  builder() async {
    database = await $FloorAppDatabase.databaseBuilder('User.db').build();
    dao = database.dao;
    // return database.dao;
  }
   dio(){
     Dio dio = Dio();
     apiMethod = RestClient(dio);
   }
}
