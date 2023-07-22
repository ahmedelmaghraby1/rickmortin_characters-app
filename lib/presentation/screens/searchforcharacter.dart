import 'package:bb_characters/constants/colors.dart';
import 'package:bb_characters/presentation/screens/characters_screen.dart';
import 'package:bb_characters/presentation/widgets/chracteritem.dart';
import 'package:flutter/material.dart';
import 'package:bb_characters/data/models/characters.dart' as char;

class CharacterSearch extends SearchDelegate {
  final List<char.Characters> characters;

  CharacterSearch({required this.characters});
  @override
  List<Widget>? buildActions(BuildContext context) {
    query == "";
    return [
      IconButton(
          onPressed: () {
            query = "";
            Navigator.pop(context);
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: Icon(Icons.arrow_back))
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<char.Characters> filtercharacter =
        characters.where((element) => element.name!.contains(query)).toList();
    return Scaffold(
      backgroundColor: mycolors.mygrey,
      body: GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: filtercharacter.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          padding: EdgeInsets.zero,
          itemBuilder: ((context, index) {
            return CharacterItem(
              character: filtercharacter[index],
            );
          })),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
      backgroundColor: mycolors.myyellow,
      iconTheme: IconThemeData(color: Colors.black),
    ));
  }
}
