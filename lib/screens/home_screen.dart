import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:pysychology_life_facts/screens/categories_screen.dart';
import 'package:pysychology_life_facts/widgets/cat_Textcard_widgte.dart';

import '../models/MyQoutesModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<MyQoutesModel>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/psychology_hacks.json');
    final list = jsonDecode(jsonData) as List<dynamic>;
    return list.map((e) => MyQoutesModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: const [
          Icon(
            Icons.favorite,
            size: 45,
            color: Colors.white60,
          ),
        ],
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
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: readJsonData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}'),
                        );
                      } else if (snapshot.hasData) {
                        final items= snapshot.data as List<MyQoutesModel>;
                        return ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_)=>CategoryScreen(myQuotes: items[index])));
                                  },
                                  child:  TextContainer(
                                    index: items[index].subNo.toString(),
                                    title: items[index].subject.toString(),
                                  ),
                                ),
                              );
                            });
                      }else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
