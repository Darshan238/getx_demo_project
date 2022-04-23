

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:getx_project_demo/model/user.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

import 'my_dao.dart';



part 'app_database.g.dart';

@Database(version: 1, entities: [User])
abstract class  AppDatabase extends FloorDatabase {
  MyDao get dao;
}
