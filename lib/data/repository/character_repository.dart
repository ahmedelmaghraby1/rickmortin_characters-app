// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bb_characters/data/models/characters.dart';
import 'package:bb_characters/data/models/quotes.dart';
import 'package:bb_characters/data/web_services/character_web_services.dart';

class CharacterRepository {
  final CharactersWebServices charactersWebServices;
  CharacterRepository(this.charactersWebServices);

  Future<List<Characters>> getallcharacters() async {
    // final List<Characters> characters;
    final chars = await charactersWebServices.getallcharacters();
    return chars.map((char) => Characters.fromJson(char)).toList();
  }

  Future<List<Quotes>> getqoute() async {
    List<dynamic> qu = await charactersWebServices.getqoute();
    List<Quotes> qoutes = qu.map((dynamic qoute) {
      return Quotes(qoute['text'], qoute['author']);
    }).toList();
    // print(qoutes);
    return qoutes;
  }
}
