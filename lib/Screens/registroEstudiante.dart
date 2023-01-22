import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uroom/Utils/BackButtom.dart';
import 'package:uroom/Utils/BottomNavigation.dart';
import 'package:uroom/model/modelo.dart';

class RegistroEstudiante extends StatefulWidget {
  // const RegistroEstudiante({super.key});

  @override
  State<RegistroEstudiante> createState() => _RegistroEstudianteState();
}

final _formKey = GlobalKey<FormState>();
final _auth = FirebaseAuth.instance;

class _RegistroEstudianteState extends State<RegistroEstudiante> {
  //controladores
  final nombresEditingController = new TextEditingController();
  final apellidosEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmarPasswordEditingController = new TextEditingController();
  //dropdownbuttom items
  // carrearas
  String? _valor;
  List _carreras = [
    'Computación',
    'Administracion Publica',
    'Agropecuaria',
    'Comercio Exterior',
    'Administracion de Empresas',
  ];
  //dropdownbuttom items
  // niveles
  String? _valor2;
  List _niveles = [
    'nivelacion',
    'primero',
    'segundo',
    'tercero',
    'cuarto',
  ];
  //dropdownbuttom items
  // roles
  List _rols = ['Estudiante'];
  var _rol = "Estudiante";
  var rool = "Estudiante";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(builder: (BuildContext context) {
            return backButton(context, Colors.black);
          }),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    'CREAR UNA CUENTA',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  _userName(),
                  _lastName(),
                  _email(),
                  _carrera(),
                  _nivel(),
                  _cedula(),
                  _roles(),
                  _password(),
                  _comfirmPassword(),
                  _buttonRegist(context),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Text(
                      'Al hacer clic en registrarse, acepta los siguientes Términos y condiciones sin reservas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
          ),
        )));
  }

  Widget _userName() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: nombresEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{4,}$');
          if (value!.isEmpty) {
            return ('El campo es obligatorio, no puede estar vacío');
          }
          if (!regex.hasMatch(value)) {
            return ('Introduzca un nombre válido ');
          }
          return null;
        },
        onSaved: (value) {
          nombresEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          //prefix: Icon(Icons.person),
          hintText: 'Nombre',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _lastName() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        autofocus: false,
        controller: apellidosEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{4,}$');
          if (value!.isEmpty) {
            return ('El campo es obligatorio, no puede estar vacío');
          }
          if (!regex.hasMatch(value)) {
            return ('Introduzca un apellido válido ');
          }
          return null;
        },
        onSaved: (value) {
          apellidosEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          //prefix: Icon(Icons.person),
          hintText: 'Apellido',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _carrera() {
    return Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 18),
          child: DropdownButton(
            //elevation: 5,

            hint: Text(
              'Seleccione su carrera',
              // style: TextStyle(color: Colors.grey.shade400),
            ),
            icon: Icon(Icons.arrow_drop_down),
            isExpanded: true,
            value: _valor,
            onChanged: (value) {
              setState(() {
                _valor = value as String?;
              });
            },
            items: _carreras.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ));
  }

  Widget _nivel() {
    return Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 18),
          child: DropdownButton(
            //elevation: 5,

            hint: Text(
              'Seleccione el nivel que cursa',
              // style: TextStyle(color: Colors.grey.shade400),
            ),
            icon: Icon(Icons.arrow_drop_down),
            isExpanded: true,
            value: _valor2,
            onChanged: (value) {
              setState(() {
                _valor2 = value as String?;
              });
            },
            items: _niveles.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ));
  }

  Widget _email() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ('Por favor ingrese su correo electrónico');
          }
          // validación de correo electrónico
          if (!RegExp('^[a-z]+.[a-z]+@[upec]+.[edu]+.[ec]').hasMatch(value)) {
            return ('Introduzca un correo electrónico válido');
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          //prefix: Icon(Icons.person),
          hintText: 'Correo',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _cedula() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        autofocus: false,
        //controller: emailEditingController,
        //keyboardType: TextInputType.emailAddress,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{10,}$');
          if (value!.isEmpty) {
            return ('Por favor ingrese su numero de cedula');
          }
          // validación de cedula
          if (!RegExp('^[0-9]').hasMatch(value)) {
            return ('Introduzca correctamente sus credenciales');
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          //prefix: Icon(Icons.person),
          hintText: 'Cedula',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ('La contraseña es requerida para el ingreso');
          }
          if (!regex.hasMatch(value)) {
            return ('Introduzca una contraseña válida (mínimo. 6 caracteres)');
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          // prefix: Icon(Icons.lock),
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _comfirmPassword() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        autofocus: false,
        controller: confirmarPasswordEditingController,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        validator: (value) {
          if (confirmarPasswordEditingController.text !=
              passwordEditingController.text) {
            return 'La contraseña no coincide';
          }
          return null;
        },
        onSaved: (value) {
          confirmarPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          // prefix: Icon(Icons.lock),
          hintText: 'Confirmar Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _roles() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 18),
        child: DropdownButton(
          hint: Text(
            'Seleccione el rol',
            // style: TextStyle(color: Colors.grey.shade400),
          ),
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          items: _rols.map((_rolSelect) {
            return DropdownMenuItem(
              value: _rolSelect,
              child: Text(_rolSelect),
            );
          }).toList(),
          onChanged: (_nuevoRolSelect) {
            setState(() {
              _rol = _nuevoRolSelect as String;
              rool = _nuevoRolSelect;
            });
          },
          value: _rol,
        ),
      ),
    );
  }

  Widget _buttonRegist(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      margin: EdgeInsets.only(top: 35),
      child: RaisedButton(
          onPressed: () {
            setState(() {});
            registro(emailEditingController.text,
                passwordEditingController.text, rool);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.green,
          child: Text(
            'Registrarse ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          )),
    );
  }

  void registro(String email, String password, String rool) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFireStore(email, rool)})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.massage);
      });
    }
  }

  postDetailsToFireStore(String email, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.user = user.uid;
    userModel.nombres = nombresEditingController.text;
    userModel.apellidos = apellidosEditingController.text;
    userModel.password = passwordEditingController.text;
    userModel.roll = rool;
    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.tomMap());
    Fluttertoast.showToast(msg: 'La cuenta se creo correctamente');
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => BNavigattor()),
        (route) => false);
  }
}
