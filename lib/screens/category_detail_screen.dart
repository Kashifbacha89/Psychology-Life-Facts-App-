import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pysychology_life_facts/models/MyQoutesModel.dart';
import 'package:share_plus/share_plus.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen(
      {Key? key, required this.title, required this.index, required this.name, required this.myList,})
      : super(key: key);
  final String title;
  final String index;
  final String name;
  final List<Quotes>? myList;



  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.yellow.shade300,
                Colors.red.shade300,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 25,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.name.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 380,
                  child: Card(
                    elevation: 6.6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${widget.index.toString()}/${widget.myList!.length}',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.favorite_outlined,
                                size: 40,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Text(
                              widget.title.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              Expanded(
                
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(

                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                Clipboard.setData(
                                    ClipboardData(text: widget.title.toString()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(backgroundColor: Colors.teal.shade300,
                                  content: const Text('copy to ClipBoard',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200),),),
                                );
                              });
                            },
                            icon: const Icon(
                              Icons.copy_rounded,
                              size: 50,
                            )),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                Share.share(widget.title.toString());
                              });
                            },
                            icon: const Icon(
                              Icons.share,
                              size: 50,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
