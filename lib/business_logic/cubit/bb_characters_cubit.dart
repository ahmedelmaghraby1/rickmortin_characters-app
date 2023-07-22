import 'package:bb_characters/data/models/quotes.dart';
import 'package:bb_characters/data/repository/character_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/characters.dart';

part 'bb_characters_state.dart';

class BbCharactersCubit extends Cubit<BbCharactersState> {
  List<Characters> characters = [];
  List<Quotes> quotes = [];
  final CharacterRepository characterRepository;
  BbCharactersCubit(this.characterRepository) : super(BbCharactersInitial());

  List<Characters> getallcharacters() {
    characterRepository.getallcharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  List<Quotes> getqoutes() {
    characterRepository.getqoute().then((value) {
      emit(QoutesLoaded(value));
      quotes = value;
      print(quotes);
    });

    return quotes;
  }
  // List<Quotes> getqoutes() {
  //   characterRepository.getqoute().then((value) {
  //     emit(QoutesLoaded(quotes));
  //     quotes = value;
  //   });
  //   return quotes;
  // }
}
