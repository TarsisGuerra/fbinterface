import 'package:fb_flutter/telas/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner:
        false, //mostra um pequeno banner "DEBUG", mas como é false, não vai aparecer
    home: Home(),
  ));
}
