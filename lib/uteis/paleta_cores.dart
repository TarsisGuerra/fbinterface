import 'package:flutter/material.dart';

class PaletaCores {
//static é usado para acessar sem precisar isntanciar
  static const Color azulFacebook = Color(0xFF1777F2);
  static const LinearGradient degradeEstoria = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black54],
  );
}
