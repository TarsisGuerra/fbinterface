import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_flutter/dados/dados.dart';
import 'package:fb_flutter/modelos/modelos.dart';
import 'package:flutter/material.dart';

class AreaStoria extends StatelessWidget {
  final Usuario usuario;
  final List<Estoria> estorias;

  const AreaStoria({
    required this.usuario,
    required this.estorias,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: estorias.length,
        itemBuilder: (contect, indice) {
          Estoria estoria = estorias[indice];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CartaoEstoria(
              estoria: estoria,
            ),
          );
        },
      ),
    );
  }
}

class CartaoEstoria extends StatelessWidget {
  Estoria estoria;

  CartaoEstoria({
    required this.estoria,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      //permite que seja colocado um item sobre o outros
      children: [
        ClipRRect(
            //usado para arredondar as bordas
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: estoria.urlImagem,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}
