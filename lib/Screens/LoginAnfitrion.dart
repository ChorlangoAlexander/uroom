import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uroom/Screens/RegistroAnfitrion.dart';
import 'package:uroom/Services/Auth.dart';
import 'package:uroom/Utils/BackButtom.dart';
import 'package:uroom/Utils/BottomNavigation.dart';

class LoginAnfitrion extends StatefulWidget {
  @override
  State<LoginAnfitrion> createState() => _LoginAnfitrionState();
}

class _LoginAnfitrionState extends State<LoginAnfitrion> {
  final _formKey = GlobalKey<FormState>();
//controlador de edicion
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
//firebase
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://img.freepik.com/foto-gratis/bienvenido-pub_1098-22012.jpg?w=826&t=st=1673044232~exp=1673044832~hmac=fc934f63587bab21c481e93fc19752cdb9c766e350676006af80b9a8558b1ab5'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: backButton2(context),
                  )
                ],
              ),
              Transform.translate(
                offset: Offset(0.0, -20.0),
                child: Container(
                  width: double.infinity,
                  height: 640,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'BIENVENIDO',
                            style: TextStyle(
                                color: Colors.green.shade500,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            'Inicie sesión en su cuenta',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          _email(),
                          _password(),
                          _buttonLogin(context),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Conecta con ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 24, 106, 84),
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                          //_googlebutoom(context),
                          _googlebutoom(context),
                          _facebookbutoom(context),

                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => ForgotPassword(),
                                //   ),
                                // );
                              },
                              child: Expanded(
                                child: Text(
                                  '¿Olvidaste tu contraseña?',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 24, 106, 84),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                margin: EdgeInsets.only(top: 15 - 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '¿No tienes una cuenta?',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistroScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Registrate',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 24, 106, 84),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // _googlebutoom(context),
                          // _facebookbutoom(context)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   child: _googlebutoom(context),
              // )
            ],
          ),
        ),
      ),
    );
  }

//funcion login
  void inicioSesion(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'inicio de sesión correcto'),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BNavigattor()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  Widget _email() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ('Por favor ingrese su correo electrónico');
          }
          // validación de correo electrónico
          if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+.-]+.[a-z]')
              .hasMatch(value)) {
            return ('Introduzca un correo electrónico válido');
          }
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Usuario',
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
        controller: passwordController,
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
          passwordController.text = value!;
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

  Widget _buttonLogin(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      margin: EdgeInsets.only(top: 35),
      child: RaisedButton(
        onPressed: () {
          inicioSesion(emailController.text, passwordController.text);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.green.shade500,
        child: Text(
          'Iniciar Sesión',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _googlebutoom(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
          onPressed: () async {
            await signInWithGoogle(context: context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BNavigattor()));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Google',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _facebookbutoom(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        onPressed: () async {
          // await signInWithGoogle(context: context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => BNavigattor()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.blue.shade600,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
