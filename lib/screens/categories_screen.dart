import 'package:flutter/material.dart';
import 'package:pysychology_life_facts/models/MyQoutesModel.dart';
import 'package:pysychology_life_facts/screens/category_detail_screen.dart';
import 'package:pysychology_life_facts/widgets/cat_Textcard_widgte.dart';
import 'package:pysychology_life_facts/widgets/growable_container.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.myQuotes}) : super(key: key);
  final MyQoutesModel myQuotes;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Text(
          '${widget.myQuotes.subject}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.amber.shade300,
                Colors.red.shade200,
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
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
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.amber.shade300,
              Colors.red.shade200,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: widget.myQuotes.quotes!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoryDetailScreen(
                          title:widget.myQuotes.quotes![index].text.toString(),
                          name:widget.myQuotes.subject.toString(),
                          index:widget.myQuotes.quotes![index].textNo.toString(),

                          myList: widget.myQuotes.quotes,
                        )));
                      },
                      child: GrowableContainer(
                          index: widget.myQuotes.quotes![index].textNo.toString(),
                          title: widget.myQuotes.quotes![index].text.toString()),

                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
