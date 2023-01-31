import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uroom/Screens/Perfil.dart';
import 'package:uroom/Utils/NavBarAmfitrion.dart';
import 'package:uroom/Utils/NavBarEstudiante.dart';
import 'package:uroom/model/modelo.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return controNav();
  }
}

class controNav extends StatefulWidget {
  // const controNav({super.key});
  controNav();

  @override
  State<controNav> createState() => _controNavState();
}

class _controNavState extends State<controNav> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var emaill;
  var id;
  CrudMethods crudMethods = new CrudMethods();

  QuerySnapshot? blogSnapshot;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.roll.toString();
        id = loggedInUser.nombres.toString();
      });
    });
  }

//ruta para pantallas de home
  routing() {
    if (rooll == 'Estudiante') {
      return NavBarEstudiantes(navEstudiante: id);
    } else {
      return NavBarAmfitrion(navAmfitrion: id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return routing();
  }
}
