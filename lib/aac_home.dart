import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'animal.dart';
import 'animal_card.dart';
import 'db_service.dart';
import 'info.dart';

class AACHome extends StatefulWidget {
  AACHome({Key key}) : super(key: key);
  
  @override
  _AACHomeState createState() => _AACHomeState();
}

class _AACHomeState extends State<AACHome> {
  Future<List<Animal>> futureAnimals;

  var dbService = new DBService();
  
  @override
  void initState() {
    super.initState();
    futureAnimals = dbService.fetchAnimals();
  }
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoptable Pets'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search), 
            onPressed: () => {}
          ),
        ],
      ),
      body: FutureBuilder<List<Animal>>(
        future: futureAnimals,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  child: Hero(
                    tag: 'imageHero',
                    child: AnimalCard(imageLink: snapshot.data[index].image)
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_){
                      return InfoScreen(animal: snapshot.data[index]);
                    }));
                  } 
                );
              },
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Loading Pets...', style: Theme.of(context).textTheme.headline6),
                  CircularProgressIndicator()
                ]
              )
            )
          );
        },
      )
    );
  }
}