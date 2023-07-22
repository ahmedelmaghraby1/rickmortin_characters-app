// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bb_characters_cubit.dart';

@immutable
abstract class BbCharactersState {}

class BbCharactersInitial extends BbCharactersState {}

class CharactersLoaded extends BbCharactersState {
  final List<Characters> characters;
  CharactersLoaded(
    this.characters,
  );
}

// class CharactersDetailsLoaded extends BbCharactersState {
//   final List<Characters> characters;

//   CharactersDetailsLoaded(this.characters);
// }

class QoutesLoaded extends BbCharactersState {
  final List<Quotes> qoutes;
  QoutesLoaded(
    this.qoutes,
  );
}
