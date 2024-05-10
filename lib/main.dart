import 'package:fb_flutter/telas/home.dart';
import 'package:fb_flutter/telas/principal.dart';
import 'package:fb_flutter/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    //home: Home(),
    home: Principal(),
  ));
}
