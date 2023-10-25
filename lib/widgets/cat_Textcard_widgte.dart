import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({Key? key, required this.index, required this.title}) : super(key: key);
  final String index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,

      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),

        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: Row(
            children:   [
              SizedBox(width: 5,),
                Text(
                index,
              ),
               const SizedBox(
                width: 10,
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   width: 1,
                   color: Colors.black,
                 ),
               ),
               const SizedBox(width:10 ,),
               Text(title,style: GoogleFonts.poppins(
                 textStyle: const TextStyle(fontWeight: FontWeight.w500)
               ),),

            ],
          ),
        ),
      ),

    );
  }
}
