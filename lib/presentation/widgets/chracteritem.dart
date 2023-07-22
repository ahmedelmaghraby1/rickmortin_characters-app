// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bb_characters/constants/colors.dart';
import 'package:bb_characters/constants/strings.dart';
import 'package:bb_characters/data/models/characters.dart' as ch;
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final ch.Characters character;
  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: mycolors.mywhite, borderRadius: BorderRadius.circular(8)),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, characters_details_screen,
              arguments: character);
        },
        child: GridTile(
          child: Hero(
            tag: {character.id},
            child: Container(
                color: mycolors.mygrey,
                child: character.image!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder: "assets/images/loading.gif",
                        image: character.image!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/loading.gif",
                      )),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              "${character.name}",
              style: TextStyle(
                  color: mycolors.mywhite, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
