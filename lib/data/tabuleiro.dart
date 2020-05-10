import 'package:flutter/material.dart';
import 'package:flutter_jogo_velha/data/item.dart';
import 'package:flutter_jogo_velha/data/minimax.dart';
import 'package:scoped_model/scoped_model.dart';
 

class Tabuleiro extends Model{
  
  List<Item> tabela= [];
  String anterior ="";
  List<ItemScore> escores = [];
  int tamanhoProfundidade = 0;

  int contador = 1;
 
  static Tabuleiro of(BuildContext context) =>
      ScopedModel.of<Tabuleiro>(context);


 List<Item> _inicializar (){
  return [
    Item(valor: 1,tipo: "",posicao: 0, ativo: false ),
    Item(valor: 1,tipo: "",posicao: 1, ativo: false ),
    Item(valor: 1,tipo: "",posicao: 2, ativo: false ),
    Item(valor: 1,tipo: "",posicao: 3, ativo: false ),
    Item(valor: 1,tipo: "",posicao: 4, ativo: false ),
    Item(valor: 1,tipo: "",posicao: 5, ativo: false ),
    Item(valor: 1,tipo: "",posicao: 6, ativo: false ),
    Item(valor: 1,tipo: "",posicao: 7, ativo: false ),
    Item(valor: 1,tipo: "",posicao: 8, ativo: false ),
  ];
 }

 iniciarTabela(){
   this.tabela = _inicializar();
   anterior = "";
   escores = [];
   notifyListeners();
 }

  bool ganhou(){
 
      if((tabela[0].ativo && tabela[0].tipo=="X") && (tabela[1].ativo && tabela[1].tipo=="X") && (tabela[2].ativo&& tabela[2].tipo=="X")) return true;// linha 1
      if((tabela[3].ativo&& tabela[3].tipo=="X") && (tabela[4].ativo&& tabela[4].tipo=="X") && (tabela[5].ativo && tabela[5].tipo=="X")) return true;// linha 2
      if((tabela[6].ativo&& tabela[6].tipo=="X") && (tabela[7].ativo&& tabela[7].tipo=="X") && (tabela[8].ativo&& tabela[8].tipo=="X")) return true;// linha 3

      if((tabela[0].ativo && tabela[0].tipo=="X") && (tabela[3].ativo && tabela[3].tipo=="X") && (tabela[6].ativo && tabela[6].tipo=="X")) return true;// col 1
      if((tabela[1].ativo && tabela[1].tipo=="X") && (tabela[4].ativo && tabela[4].tipo=="X") && (tabela[7].ativo && tabela[7].tipo=="X")) return true;// col 2
      if((tabela[2].ativo && tabela[2].tipo=="X") && (tabela[5].ativo && tabela[5].tipo=="X") && (tabela[8].ativo && tabela[8].tipo=="X")) return true;// col 3

      if((tabela[0].ativo && tabela[0].tipo=="X") && (tabela[4].ativo && tabela[4].tipo=="X") && (tabela[8].ativo && tabela[8].tipo=="X")) return true;// diagonal 1
      if((tabela[2].ativo && tabela[2].tipo=="X") && (tabela[4].ativo && tabela[4].tipo=="X") && (tabela[6].ativo && tabela[6].tipo=="X")) return true;// diagonal 2
   
     
    notifyListeners();
     return false;
  }

  
  bool empate(){
    int contador = 0;
    for (var item in tabela) {
        if(item.ativo) contador++;
    }

    if(contador == 9) return true;
     
    notifyListeners();
     return false;
  }

   bool perdeu(){
 
      if((tabela[0].ativo && tabela[0].tipo=="O") && (tabela[1].ativo && tabela[1].tipo=="O") && (tabela[2].ativo&& tabela[2].tipo=="O")) return true;// linha 1
      if((tabela[3].ativo&& tabela[3].tipo=="O") && (tabela[4].ativo&& tabela[4].tipo=="O") && (tabela[5].ativo && tabela[5].tipo=="O")) return true;// linha 2
      if((tabela[6].ativo&& tabela[6].tipo=="O") && (tabela[7].ativo&& tabela[7].tipo=="O") && (tabela[8].ativo&& tabela[8].tipo=="O")) return true;// linha 3

      if((tabela[0].ativo && tabela[0].tipo=="O") && (tabela[3].ativo && tabela[3].tipo=="O") && (tabela[6].ativo && tabela[6].tipo=="O")) return true;// col 1
      if((tabela[1].ativo && tabela[1].tipo=="O") && (tabela[4].ativo && tabela[4].tipo=="O") && (tabela[7].ativo && tabela[7].tipo=="O")) return true;// col 2
      if((tabela[2].ativo && tabela[2].tipo=="O") && (tabela[5].ativo && tabela[5].tipo=="O") && (tabela[8].ativo && tabela[8].tipo=="O")) return true;// col 3

      if((tabela[0].ativo && tabela[0].tipo=="O") && (tabela[4].ativo && tabela[4].tipo=="O") && (tabela[8].ativo && tabela[8].tipo=="O")) return true;// diagonal 1
      if((tabela[2].ativo && tabela[2].tipo=="O") && (tabela[4].ativo && tabela[4].tipo=="O") && (tabela[6].ativo && tabela[6].tipo=="O")) return true;// diagonal 2
   
    notifyListeners();

      return false;
    
  }

}

