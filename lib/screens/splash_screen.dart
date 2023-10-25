import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pysychology_life_facts/screens/home_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        children:[
          Image.network('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg',

          fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),

           Center(child: Text(
            'Psychological Life Facts',
            style: GoogleFonts.alice(
              textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)
            ),


          ),),



        ]
      ),


      nextScreen: const HomeScreen(),
      splashIconSize: double.infinity,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.grey,
      duration: 300,

    );
  }
}