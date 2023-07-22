import 'package:bb_characters/business_logic/cubit/bb_characters_cubit.dart';
import 'package:bb_characters/constants/strings.dart';
import 'package:bb_characters/data/repository/character_repository.dart';
import 'package:bb_characters/data/web_services/character_web_services.dart';
import 'package:bb_characters/presentation/screens/characterdetails.dart';
import 'package:bb_characters/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/models/characters.dart' as char;

class Approutes {
  late CharacterRepository characterRepository;
  late BbCharactersCubit charactersCubit;
  Approutes() {
    characterRepository = CharacterRepository(CharactersWebServices());
    charactersCubit = BbCharactersCubit(characterRepository);
  }
  Route? generateroute(RouteSettings settings) {
    switch (settings.name) {
      case characters_screen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: const CharactersScreen(),
                ));
      case characters_details_screen:
        final character = settings.arguments as char.Characters;
        // final qoutes = settings.arguments as Quotes;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => charactersCubit,
                  child: CharactersDetails(
                    characters: character,
                    // quotes: qoutes,
                  ),
                ));
      // case characters_details_screen:
      //   return BlocProvider(create: (BuildContext (context) => ))
    }
    return null;
  }
}
