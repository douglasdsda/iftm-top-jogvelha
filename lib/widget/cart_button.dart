import 'package:flutter/material.dart';
import 'package:flutter_jogo_velha/data/tabuleiro.dart';


class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return FloatingActionButton(
      child: Icon(Icons.restore, color: Colors.white,),
      onPressed: (){
  
       Tabuleiro.of(context).iniciarTabela();
     
      },
    );
  }}