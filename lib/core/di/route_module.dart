import 'package:fluro/fluro.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RouteModule {
  @lazySingleton
  FluroRouter get fluroRouter => FluroRouter();
}
