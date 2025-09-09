import 'package:flutter/cupertino.dart';
import 'export.dart';

void main() async{
  await injectServices();
  runApp(const App());
}