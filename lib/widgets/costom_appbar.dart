import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: const Icon(
        Icons.share,
        size: 45,
        color: Colors.white,
      ),
      title: const Text(
        'Psyschology Hacks ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration:  BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.yellow.shade200,
              Colors.red.shade100,
            ],
          ),
        ),
      ),
      actions: const [
        Icon(
          Icons.heart_broken_sharp,
          size: 45,
          color: Colors.white,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
      ),
    );
  }
}
