import 'package:fb_flutter/componentes/area_criar_postagem.dart';
import 'package:fb_flutter/componentes/area_estoria.dart';
import 'package:fb_flutter/componentes/botao_circulo.dart';
import 'package:fb_flutter/componentes/cartao_postagem.dart';
import 'package:fb_flutter/dados/dados.dart';
import 'package:fb_flutter/modelos/postagem.dart';
import 'package:fb_flutter/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SCAFFOLD É UM WIDGET QUE PERMITE MONTAR A ESTRUTURA BÁSICA DE UMA TELA USANDO COMPONENTES DO MATERIAL DESIGN
      body: CustomScrollView(
        //customScroolView onsegue criar efeitos de rolagem
        slivers: [
          //Um sliver é uma parte de uma área rolável que você pode definir para se comportar de maneira especial.
          SliverAppBar(
            backgroundColor: Colors.white,
            // expandedHeight: 300, //MUDA O TAMNHO DO APP BAR
            floating: true,
            centerTitle: false,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              BotaoCirculo(
                icone: Icons.search,
                iconeTamanho: 30,
                onPressed: () {},
              ),
              BotaoCirculo(
                icone: LineIcons.facebookMessenger,
                iconeTamanho: 30,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: AreaCriarPostagem(
              usuario: usuarioAtual,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: AreaStoria(
                usuario: usuarioAtual,
                estorias: estorias,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, indice) {
              Postagem postagem = postagens[indice];
              return CartaoPostagem(postagem: postagem);
            }, childCount: postagens.length),
          )
        ],
      ),
    );
  }
}
