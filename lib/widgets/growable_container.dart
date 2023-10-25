import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class GrowableContainer extends StatelessWidget {
  const GrowableContainer({Key? key, required this.title, required this.index,}) : super(key: key);
  final String title;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6,right: 6),
      child: Container(
        height: 160,

        child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),

        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: Row(
            children:   [
              const SizedBox(width: 10,),
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
              Flexible(child: Text(title,style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontWeight: FontWeight.w500)
              ),)),

            ],
          ),
        ),
      ),
      ),
    );
  }
}
