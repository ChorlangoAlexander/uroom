import 'package:flutter/material.dart';
import 'package:uroom/Utils/addPost.dart';
import 'package:uroom/model/modelo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeEstudiante extends StatefulWidget {
  String nombreEstudiante;
  HomeEstudiante({required this.nombreEstudiante});
  @override
  _HomeEstudianteState createState() =>
      _HomeEstudianteState(id: nombreEstudiante);
}

class _HomeEstudianteState extends State<HomeEstudiante> {
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _HomeEstudianteState({required this.id});
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
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

  CrudMethods crudMethods = new CrudMethods();

  QuerySnapshot? blogSnapshot;

  @override
  Widget blogsList() {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 24),
        itemCount: blogSnapshot?.docs.length,
        itemBuilder: (context, index) {
          return BlogTile(
            author: blogSnapshot?.docs[index].get('author'),
            title: blogSnapshot?.docs[index].get('title'),
            desc: blogSnapshot?.docs[index].get('desc'),
            imgUrl: blogSnapshot!.docs[index].get('imgUrl'),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: blogSnapshot != null
              ? blogsList()
              : Container(
                  child: Center(
                  child: CircularProgressIndicator(),
                )),
        ),
      ),
    );
  }
}

Widget buildImage(String cardImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 200.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            cardImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );

class BlogTile extends StatelessWidget {
  final String imgUrl, title, desc, author;
  BlogTile(
      {required this.author,
      required this.desc,
      required this.imgUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black.withOpacity(0.70),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '$desc - By $author',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _swiper() {
    return Container();
  }
}
