import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aac_app/animal.dart';

class DBService {
  
  //used to get all animals from the api
  Future<List<Animal>> fetchAnimals() async {
    final response = await http.get(Uri.https('aacad_server-hernandezjuanm39245690.codeanyapp.com', 'search/'));
    
    //will implement 'search by' later
    // await http.get(Uri.https('aacad_server-hernandezjuanm39245690.codeanyapp.com', 'search/byId/A764237'));

    if (response.statusCode == 200) {
      //OK Response from server

      var resp = jsonDecode(response.body);
      List<Animal> animalList = [];

      await resp.forEach((element) => {
        animalList.add(Animal.fromJson(element))
      });

      return animalList;
    } else {
      throw Exception('Failed to load animal');
    }
  }
}



