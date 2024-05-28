import 'package:fb_flutter/componentes/imagem_perfil.dart';
import 'package:fb_flutter/modelos/usuario.dart';
import 'package:flutter/material.dart';

class BotaoImagemPerfil extends StatelessWidget {
  final Usuario usuario;
  final VoidCallback onTap;

  const BotaoImagemPerfil(
      {required this.usuario, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagemPerfil(
            urlImagem: usuario.urlImagem,
            foiVisualizado: true,
          ),
          const SizedBox(
            width: 4,
          ),
          Flexible(
              child: Text(
            usuario.nome,
            style: const TextStyle(
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
