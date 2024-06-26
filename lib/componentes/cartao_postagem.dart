import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_flutter/componentes/imagem_perfil.dart';
import 'package:fb_flutter/modelos/postagem.dart';
import 'package:fb_flutter/uteis/paleta_cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CartaoPostagem({
    required this.postagem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          //cabeçalho
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabecalhoPostagem(postagem: postagem),
                Text(postagem.descricao),
              ],
            ),
          ),
          //Imagem da postagem
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(imageUrl: postagem.urlImagem),
          ),
          //Estatisticas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: EstatisticasPostagem(postagem: postagem),
          ),
        ],
      ),
    );
  }
}

class EstatisticasPostagem extends StatelessWidget {
  final Postagem postagem;

  const EstatisticasPostagem({required this.postagem, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  color: PaletaCores.azulFacebook, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "${postagem.curtidas}",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Text(
              "${postagem.comentarios} comentários",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "${postagem.compartilhamentos} compartilhamentos",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
        const Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            BotaoPostagem(
              icone: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              texto: "Curtir",
              onTap: () {},
            ),
            BotaoPostagem(
              icone: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              texto: "Comentar",
              onTap: () {},
            ),
            BotaoPostagem(
              icone: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              texto: "Compartilhar",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class BotaoPostagem extends StatelessWidget {
  final Icon icone;
  final String texto;
  final VoidCallback onTap;

  const BotaoPostagem({
    required this.icone,
    required this.texto,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Row(
            children: [
              icone,
              const SizedBox(
                width: 4,
              ),
              Text(
                texto,
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class CabecalhoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CabecalhoPostagem({required this.postagem, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlImagem: postagem.usuario.urlImagem,
          foiVisualizado: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postagem.usuario.nome,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${postagem.tempoAtras} - ",
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
    );
  }
}
