import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:uroom/Utils/CustomCliper.dart';
import 'package:uroom/Utils/Topbar.dart';
import 'package:uroom/model/modelo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StackContainer extends StatefulWidget {
  // const StackContainer({super.key});

  @override
  State<StackContainer> createState() => _StackContainerState();
}

class _StackContainerState extends State<StackContainer> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Stack(
        children: [
          //Container(),
          ClipPath(
            clipper: MycustomClipper(),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://mott.pe/noticias/wp-content/uploads/2019/03/los-50-paisajes-maravillosos-del-mundo-para-tomar-fotos.jpg'),
                ),
              ),
            ),
          ),
          Align(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProfileAvatar(
                  'https://mott.pe/noticias/wp-content/uploads/2019/03/los-50-paisajes-maravillosos-del-mundo-para-tomar-fotos.jpg',
                  borderWidth: 4,
                  radius: 60,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${usuarioLogeado.nombres} ${usuarioLogeado.apellidos}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                Text(
                  '${usuarioLogeado.email}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}
