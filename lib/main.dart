import 'dart:async';
import 'dart:convert';

import 'package:aac_app/aac_home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'animal.dart';
import 'animal_card.dart';
import 'db_service.dart';
import 'info.dart';
import 'aac_home.dart';
import 'info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Animal testAnimal = new Animal(
    animalType: 'Dog',
    description: 'Shelter staff named me Drew. I am a blue and white neutered male. I am about 11 years old.',
    image: 'https://petharbor.com/get_image.asp?RES=Detail&ID=A602060&LOCATION=ASTN',
    id: 'A602060',
    kennelNo: 'IN FOSTER',
    name: 'Drew'
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adoptable Animals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        ),
        buttonColor: Colors.lightGreen
      ),
      home: Navigator(
        pages: [
          MaterialPage(child: AACHome()),
          // MaterialPage(child: InfoScreen(animal: testAnimal)),
        ]
      )
    );
  }
}