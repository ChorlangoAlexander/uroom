import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? user;
  String? email;
  String? nombres;
  String? apellidos;
  String? password;
  String? nivel;
  String? carrera;
  String? cedula;
  String? fechaNacimiento;
  String? roll;

  UserModel(
      {this.user,
      this.email,
      this.nombres,
      this.apellidos,
      this.password,
      this.nivel,
      this.carrera,
      this.cedula,
      this.fechaNacimiento,
      this.roll});

  factory UserModel.fromMap(map) {
    return UserModel(
        user: map['user'],
        email: map['email'],
        nombres: map['nombres'],
        apellidos: map['apellidos'],
        password: map['password'],
        nivel: map['nivel'],
        carrera: map['carrera'],
        cedula: map["cedula"],
        fechaNacimiento: map["fechaNacimiento"],
        roll: map['roll']);
  }
  //enviar datos al servidor
  Map<String, dynamic> tomMap() {
    return {
      'userid': user,
      'email': email,
      'nombres': nombres,
      'apellidos': apellidos,
      'password': password,
      'nivel': nivel,
      'carrera': carrera,
      'cedula': cedula,
      'fechaNacimiento': fechaNacimiento,
      'roll': roll
    };
  }
}

//modelo agregar blog
class CrudMethods {
  Future<void> addData(blogData) async {
    print(blogData);
    FirebaseFirestore.instance
        .collection("blogs")
        .add(blogData)
        .then((value) => print(value))
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("blogs").get();
  }
}
