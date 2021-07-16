import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aac_app/animal.dart';
import 'package:intl/intl.dart';

class InfoScreen extends StatefulWidget {
  final Animal animal;

  InfoScreen({@required this.animal});

  _InfoScreenState createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen>{
  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((toBeginningOfSentenceCase(widget.animal.name)))
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Image.network(
              widget.animal.image,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text('ID: ${widget.animal.id}', style: TextStyle(fontSize: 20))
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text('About Me: ${widget.animal.description}', style: TextStyle(fontSize: 20)),
            ),            
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text('Kennel No: ${widget.animal.kennelNo}', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20),
            if(widget.animal.staffComments != null)(
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text('Staff Comments: ${widget.animal.staffComments}', style: TextStyle(fontSize: 20))
              )
            ) else (
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text('No staff comments at this time', style: TextStyle(fontSize: 20))
              )
            ),
            SizedBox(height: 20),          
            /*
              Elevated Button will be used to schedule meeting with pet
            */
            // ElevatedButton(
            //   onPressed: () => {}, 
            //   child: Text('View Staff Comments')
            // )
          ]
        )
      )
    );
  }
}