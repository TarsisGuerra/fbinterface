import 'package:fb_flutter/modelos/modelos.dart';

class Estoria {
  Usuario usuario;
  String urlImagem;
  bool foiVisualizado;

  Estoria(
      {required this.usuario,
      required this.urlImagem,
      this.foiVisualizado = false});
}
