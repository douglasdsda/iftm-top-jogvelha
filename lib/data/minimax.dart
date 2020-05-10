import 'dart:math';

import 'package:flutter_jogo_velha/data/item.dart';

class Minimax {
  List<Item> estado = [];
  List<Item> tabela = [];
  List<ItemScore> itemScores = [];
  Item jogadaComputador;
  // Contador contador;
  int tamanhoProfundidade = 0;

  Minimax(this.estado) {
    // List<Item> novoEstados = List<Item>();

    for (var item in this.estado) {
      Item aux = new Item();
      aux.ativo = item.ativo;
      aux.tipo = item.tipo;
      aux.posicao = item.posicao;
      aux.valor = item.valor;

      tabela.add(aux);
    }

     List<Item> listaLivre = livres();
    //  this.contador = Contador();
    //  this.contador.valor  = listaLivre.length + 1;
  }

  int decisaoMinimax(int profundidade, int turno, int contador) {
    tamanhoProfundidade = profundidade;

    if (ganhou()) return 1;
    if (perdeu()) return -1;

    List<Item> listaLivre = livres();

   

    if (listaLivre.isEmpty) return 0;

    if(listaLivre.length > 0 )  contador  =  contador* listaLivre.length;

    // List<int> escore = [];
    int minimo = 9999, maximo = -9999;

    for (int i = 0; i < listaLivre.length; ++i) {
      Item item = listaLivre[i];

      if (turno == 1) {
        tabela[item.posicao].ativo = true;
        tabela[item.posicao].tipo = "X";
        int atualScore = decisaoMinimax(profundidade + 1, 2, contador);
        maximo = max(atualScore, maximo);

        if (profundidade == 0) itemScores.add(ItemScore(atualScore, item));
        if (atualScore >= 0) {
          if (profundidade == 0) jogadaComputador = item;
        }
        if (atualScore == 1) {
          tabela[item.posicao].ativo = false;
          tabela[item.posicao].tipo = "";
          break;
        }

        if (i == listaLivre.length - 1 && maximo < 0) {
          if (profundidade == 0) jogadaComputador = item;
        }
      } else if (turno == 2) {
        tabela[item.posicao].ativo = true;
        tabela[item.posicao].tipo = "O";
        int atualScore = decisaoMinimax(profundidade + 1, 1, contador);
        minimo = min(atualScore, minimo);

        if (minimo == -1) {
          tabela[item.posicao].ativo = false;
          tabela[item.posicao].tipo = "";
          break;
        }
      }
      tabela[item.posicao].ativo = false;
      tabela[item.posicao].tipo = ""; 
    }
    return turno == 1 ? maximo : minimo;
  }

  List<Item> livres() {
    List<Item> lista = [];
    for (var i = 0; i < tabela.length; i++) {
      if (!tabela[i].ativo) {
        Item aux = new Item();
        aux.ativo = tabela[i].ativo;
        aux.tipo = tabela[i].tipo;
        aux.posicao = tabela[i].posicao;
        aux.valor = tabela[i].valor;
        lista.add(aux);
      }
    }

    return lista;
  }

  bool ganhou() {
    if ((tabela[0].ativo && tabela[0].tipo == "X") &&
        (tabela[1].ativo && tabela[1].tipo == "X") &&
        (tabela[2].ativo && tabela[2].tipo == "X")) return true; // linha 1
    if ((tabela[3].ativo && tabela[3].tipo == "X") &&
        (tabela[4].ativo && tabela[4].tipo == "X") &&
        (tabela[5].ativo && tabela[5].tipo == "X")) return true; // linha 2
    if ((tabela[6].ativo && tabela[6].tipo == "X") &&
        (tabela[7].ativo && tabela[7].tipo == "X") &&
        (tabela[8].ativo && tabela[8].tipo == "X")) return true; // linha 3

    if ((tabela[0].ativo && tabela[0].tipo == "X") &&
        (tabela[3].ativo && tabela[3].tipo == "X") &&
        (tabela[6].ativo && tabela[6].tipo == "X")) return true; // col 1
    if ((tabela[1].ativo && tabela[1].tipo == "X") &&
        (tabela[4].ativo && tabela[4].tipo == "X") &&
        (tabela[7].ativo && tabela[7].tipo == "X")) return true; // col 2
    if ((tabela[2].ativo && tabela[2].tipo == "X") &&
        (tabela[5].ativo && tabela[5].tipo == "X") &&
        (tabela[8].ativo && tabela[8].tipo == "X")) return true; // col 3

    if ((tabela[0].ativo && tabela[0].tipo == "X") &&
        (tabela[4].ativo && tabela[4].tipo == "X") &&
        (tabela[8].ativo && tabela[8].tipo == "X")) return true; // diagonal 1
    if ((tabela[2].ativo && tabela[2].tipo == "X") &&
        (tabela[4].ativo && tabela[4].tipo == "X") &&
        (tabela[6].ativo && tabela[6].tipo == "X")) return true; // diagonal 2

    return false;
  }

  bool empate(List<Item> tabela) {
    int n = 0;
    for (var item in tabela) {
      if (item.ativo) n++;
    }

    if (n == 9) return true;

    return false;
  }

  bool perdeu() {
    if ((tabela[0].ativo && tabela[0].tipo == "O") &&
        (tabela[1].ativo && tabela[1].tipo == "O") &&
        (tabela[2].ativo && tabela[2].tipo == "O")) return true; // linha 1
    if ((tabela[3].ativo && tabela[3].tipo == "O") &&
        (tabela[4].ativo && tabela[4].tipo == "O") &&
        (tabela[5].ativo && tabela[5].tipo == "O")) return true; // linha 2
    if ((tabela[6].ativo && tabela[6].tipo == "O") &&
        (tabela[7].ativo && tabela[7].tipo == "O") &&
        (tabela[8].ativo && tabela[8].tipo == "O")) return true; // linha 3

    if ((tabela[0].ativo && tabela[0].tipo == "O") &&
        (tabela[3].ativo && tabela[3].tipo == "O") &&
        (tabela[6].ativo && tabela[6].tipo == "O")) return true; // col 1
    if ((tabela[1].ativo && tabela[1].tipo == "O") &&
        (tabela[4].ativo && tabela[4].tipo == "O") &&
        (tabela[7].ativo && tabela[7].tipo == "O")) return true; // col 2
    if ((tabela[2].ativo && tabela[2].tipo == "O") &&
        (tabela[5].ativo && tabela[5].tipo == "O") &&
        (tabela[8].ativo && tabela[8].tipo == "O")) return true; // col 3

    if ((tabela[0].ativo && tabela[0].tipo == "O") &&
        (tabela[4].ativo && tabela[4].tipo == "O") &&
        (tabela[8].ativo && tabela[8].tipo == "O")) return true; // diagonal 1
    if ((tabela[2].ativo && tabela[2].tipo == "O") &&
        (tabela[4].ativo && tabela[4].tipo == "O") &&
        (tabela[6].ativo && tabela[6].tipo == "O")) return true; // diagonal 2

    return false;
  }
}

class ItemScore {
  int escore;
  Item item;

  ItemScore(this.escore, this.item);
}

 