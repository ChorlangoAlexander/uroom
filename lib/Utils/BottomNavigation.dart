import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:uroom/Screens/Chats.dart';
import 'package:uroom/Screens/Home.dart';
import 'package:uroom/Screens/HomeEstudiante.dart';
import 'package:uroom/Screens/HomeAnfitrion.dart';
import 'package:uroom/Screens/Perfil.dart';
import 'package:uroom/Utils/NavBar.dart';

class BNavigattor extends StatefulWidget {
  BNavigattor({Key? key}) : super(key: key);

  @override
  State<BNavigattor> createState() => _BNavigattorState();
}

class _BNavigattorState extends State<BNavigattor> {
  int _paginaActual = 0;
  List<Widget> _paginas = [
    HomePage(),
    ChatsScreen(),
    PerfilScreen(),
    PerfilScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        flexibleSpace: Container(),
      ),
      body: _paginas[_paginaActual],
      bottomNavigationBar: Container(
        child: CurvedNavigationBar(
          color: Colors.green,
          backgroundColor: Colors.transparent,
          index: _paginaActual,
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          items: [
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.messenger_rounded, size: 30, color: Colors.white),
            Icon(Icons.notifications, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
