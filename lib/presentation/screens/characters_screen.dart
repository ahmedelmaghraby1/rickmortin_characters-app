import 'package:bb_characters/data/repository/character_repository.dart';
import 'package:bb_characters/data/web_services/character_web_services.dart';
import 'package:bb_characters/presentation/screens/searchforcharacter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bb_characters/constants/colors.dart';
import 'package:bb_characters/constants/colors.dart';
import 'package:bb_characters/data/models/characters.dart' as char;
import 'package:bb_characters/presentation/widgets/chracteritem.dart';
import 'package:bb_characters/business_logic/cubit/bb_characters_cubit.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<char.Characters> allcharacters;
  @override
  void initState() {
    CharactersWebServices charactersWebServices = CharactersWebServices();
    CharacterRepository characterRepository =
        CharacterRepository(charactersWebServices);
    characterRepository.getqoute();
    super.initState();
    allcharacters =
        BlocProvider.of<BbCharactersCubit>(context).getallcharacters();
    CharacterSearch(characters: allcharacters);
    // print(allcharacters);
  }

  Widget buildscreen() {
    return BlocBuilder<BbCharactersCubit, BbCharactersState>(
      builder: (context, state) {
        // print(state);
        if (state is CharactersLoaded) {
          allcharacters = (state).characters;
          return onloadedscreen();
        } else {
          return waitingscreen();
        }
      },
    );
  }

  Widget onloadedscreen() {
    return Scaffold(
      backgroundColor: mycolors.mygrey,
      body: GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: allcharacters.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          padding: EdgeInsets.zero,
          itemBuilder: ((context, index) {
            return CharacterItem(
              character: allcharacters[index],
            );
          })),
    );
  }

  Widget waitingscreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mycolors.myyellow,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: (context),
                  delegate: CharacterSearch(characters: allcharacters));
            },
          ),
        ],
        title: Text(
          "Characters",
          style: TextStyle(color: mycolors.mygrey),
        ),
      ),
      body: buildscreen(),
    );
  }
}
