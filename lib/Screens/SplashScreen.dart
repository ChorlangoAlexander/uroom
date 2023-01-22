import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uroom/Screens/OpcionesScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => OptionScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //Stack(
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           fit: BoxFit.fill,
          //           image: AssetImage('assets/room.jpg'),
          //           colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
          //         ),
          //       ),
          //     ),
          SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/1.jpeg'),
              width: 300,
            ),
            SizedBox(
              width: 150,
            ),
            SpinKitFadingCircle(
              color: Colors.green,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
