import 'package:flutter/material.dart';

class AnimalCard extends StatefulWidget {
  final String imageLink;

  AnimalCard({@required this.imageLink});

  _AnimalCardState createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        widget.imageLink,
        fit: BoxFit.cover,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(5),
    );
  }
}