import 'package:flutter/material.dart';
import 'package:flutter_jogo_velha/data/tabuleiro.dart';
import 'package:flutter_jogo_velha/tabs/home_tab.dart';
import 'package:flutter_jogo_velha/widget/cart_button.dart';
import 'package:flutter_jogo_velha/widget/custom_drawer.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Limpar',
      style: optionStyle,
    ),
    Text(
      'Index 1: Jogada Anterior',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) Tabuleiro.of(context).iniciarTabela();
    if (index == 1)  {
    _showOptions(context);
    }
  }

  _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: (){},
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(10.0),
              child:  ListView.builder(
                itemBuilder: (context , index){
                  return ListTile(
                    title: Text('SCORE: ${Tabuleiro.of(context).escores[index].escore} - CONTADOR: ${Tabuleiro.of(context).contador} ITEM - [ POSICAO: ${Tabuleiro.of(context).escores[index].item.posicao}]'),
                  );
                },
                itemCount: Tabuleiro.of(context).escores.length,
                ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_backup_restore),
                title: Text('Limpar'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add_check),
                title: Text('Jogada Anterior'),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.school),
              //   title: Text('School'),
              // ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) => _onItemTapped(index,context),
          ),
          //  floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Computador vs Computador"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(
            color: Colors.blueAccent,
          ),
          floatingActionButton: CartButton(),
        ),
      ],
    );

   

  }
}
