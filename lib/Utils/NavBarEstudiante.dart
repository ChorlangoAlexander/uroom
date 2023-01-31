import 'package:flutter/material.dart';
import 'package:uroom/Screens/OpcionesScreen.dart';
import 'package:uroom/model/modelo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uroom/Screens/Perfil.dart';

class NavBarEstudiantes extends StatefulWidget {
  //const NavBarEstudiantes({super.key});
  String navEstudiante;
  NavBarEstudiantes({required this.navEstudiante});
  @override
  State<NavBarEstudiantes> createState() =>
      _NavBarEstudiantesState(id: navEstudiante);
}

class _NavBarEstudiantesState extends State<NavBarEstudiantes> {
  String id;
  var rooll;
  var emaill;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel usuarioLogeado = UserModel();
  UserModel foto = UserModel();

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.usuarioLogeado = UserModel.fromMap(value.data());
      setState(() {});
      FirebaseFirestore.instance.collection('users').doc(user!.photoURL);
    });
  }

  _NavBarEstudiantesState({required this.id});
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.all(0),
            accountName: Text(
              '${usuarioLogeado.nombres} ${usuarioLogeado.apellidos}',
              style: TextStyle(color: Colors.red),
            ),
            accountEmail: Text(
              '${usuarioLogeado.email}',
              style: TextStyle(color: Colors.red),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  // user.photoURL!,
                  'https://static.vecteezy.com/system/resources/previews/005/005/788/original/user-icon-in-trendy-flat-style-isolated-on-grey-background-user-symbol-for-your-web-site-design-logo-app-ui-illustration-eps10-free-vector.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(

                //color: Colors.red,

                image: DecorationImage(
              image: AssetImage(
                'assets/2.jpeg',
                //'https://media.istockphoto.com/photos/travel-planning-background-picture-id1309040743?b=1&k=20&m=1309040743&s=170667a&w=0&h=eyIzT1oSW2B5gPMPqgybEseIYIUrY96cxPTE_B0ewVs=',
              ),
            )),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Busqueda'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.image_sharp),
            title: Text('Guardados'),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: () {}),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Salir'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OptionScreen()));
            },
          ),
        ],
      ),
    );
  }
}
