import 'package:flutter/material.dart';
import 'package:flutter_jogo_velha/data/minimax.dart';
import 'package:flutter_jogo_velha/data/tabuleiro.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();

    Tabuleiro.of(context).iniciarTabela();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Jogo da Velha"),
                centerTitle: true,
              ),
            ),
            // _buildBodyGrid(context)
            Container(
              child: ScopedModelDescendant<Tabuleiro>(
                builder: (context, child, model) {
                  if (model.ganhou()) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text('Ganhou X'),
                      ),
                    );
                  } else if (model.perdeu()) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text('Ganhou O'),
                      ),
                    );
                  } else if (model.empate()) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text('Empate'),
                      ),
                    );
                  } else {
                    return SliverStaggeredGrid.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      staggeredTiles: model.tabela.map((doc) {
                        return StaggeredTile.count(doc.valor, doc.valor);
                      }).toList(),
                      children: model.tabela.map((doc) {
                        return GestureDetector(
                          onTap: () {
                            if (!doc.ativo) {
                              // if (( Tabuleiro.of(context).anterior=="" || Tabuleiro.of(context).anterior=="O")) {
                              doc.tipo = "O";
                              doc.ativo = true;
                              // Tabuleiro.of(context).anterior="X";

                              //  else {
                              //  doc.tipo = "O";
                              //   doc.ativo = true;
                              //   Tabuleiro.of(context).anterior="O";
                              int valor = 1;
                              Minimax minimax =
                                  Minimax(Tabuleiro.of(context).tabela);
                              int posicao = minimax.decisaoMinimax(0, 1, valor);
                              print(
                                  'Posicao: ${minimax.jogadaComputador.posicao}');
                              Tabuleiro.of(context)
                                  .tabela[minimax.jogadaComputador.posicao]
                                  .ativo = true;
                              Tabuleiro.of(context)
                                  .tabela[minimax.jogadaComputador.posicao]
                                  .tipo = "X";
                              Tabuleiro.of(context).escores =
                                  minimax.itemScores;

                                 Tabuleiro.of(context).contador = valor;
                                  // minimax.contador.valor ;

                                   Tabuleiro.of(context).tamanhoProfundidade =
                                  minimax.tamanhoProfundidade;

                              // }
                            }
                          },
                          child: Container(
                            color: Colors.blueGrey,
                            child: Center(
                                child: Text(
                              doc.tipo,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            )),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
              
          ],
        ),
       
     
      ],
    );
  }
}
