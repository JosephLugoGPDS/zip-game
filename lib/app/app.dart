import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup(Environment.prod);
  runApp(App());
}
