import 'package:flutter/material.dart';

class Animal {
  final String image;
  final String id;
  final String description; 
  final String animalType; 
  final String name; 
  final String kennelNo;
  final String staffComments; 


  Animal({
    @required this.image, 
    @required this.id, 
    @required this.description, 
    @required this.animalType,
    @required this.name,
    @required this.kennelNo,
    this.staffComments
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      image: json['Image'],
      id: json['ID'],
      description: json['Description'],
      animalType: json['AnimalType'],
      name: json['Name'],
      kennelNo: json['KennelNo'],
      staffComments: json['StaffComments']
    );
  }
}