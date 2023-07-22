// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bb_characters/business_logic/cubit/bb_characters_cubit.dart';
import 'package:bb_characters/constants/colors.dart';
import 'package:bb_characters/data/models/characters.dart' as char;
import 'package:bb_characters/data/models/quotes.dart';
import 'package:bb_characters/presentation/widgets/character_details_widgets.dart';

class CharactersDetails extends StatelessWidget {
  final char.Characters characters;
  // final Quotes quotes;
  const CharactersDetails({
    Key? key,
    required this.characters,
    // required this.quotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
    }

    return Scaffold(
      backgroundColor: mycolors.mygrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 610,
            pinned: true,
            stretch: true,
            backgroundColor: mycolors.mygrey,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "${characters.name}",
                style: TextStyle(color: mycolors.mywhite),
                // textAlign: TextAlign.center,
              ),
              background: Hero(
                tag: {characters.id},
                child: Image.network(
                  "${characters.image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  character_info("Species:  ", characters.species!),
                  build_divider(300),
                  character_info("Gender:  ", characters.gender!),
                  build_divider(300),
                  character_info(
                      "appeard in:  ", characters.episode!.join("/")),
                  build_divider(275),
                  character_info("Status:  ", characters.status!),
                  build_divider(300),
                  character_info("Species:  ", characters.species!),
                  build_divider(300),
                  character_info("Gender:  ", characters.gender!),
                  build_divider(300),
                  character_info(
                      "appeard in:  ", characters.episode!.join("/")),
                  build_divider(275),
                  character_info("Status:  ", characters.status!),
                  build_divider(300),
                  character_info("Species:  ", characters.species!),
                  build_divider(300),
                  character_info("Gender:  ", characters.gender!),
                  build_divider(300),
                  character_info(
                      "appeard in:  ", characters.episode!.join("/")),
                  build_divider(275),
                  character_info("Status:  ", characters.status!),
                  build_divider(300),
                  character_info("Species:  ", characters.species!),
                  build_divider(300),
                  character_info("Gender:  ", characters.gender!),
                  build_divider(300),
                  character_info(
                      "appeard in:  ", characters.episode!.join("/")),
                  build_divider(275),
                  character_info("Status:  ", characters.status!),
                  build_divider(300),
                  BlocBuilder<BbCharactersCubit, BbCharactersState>(
                      builder: (context, state) {
                    return checkifcharactersloaded(state);
                  })
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }

  Widget checkifcharactersloaded(BbCharactersState state) {
    if (state is QoutesLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    List quotes = (state).qoutes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: mycolors.mywhite,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: mycolors.myyellow,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex]),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

      //   quotes=
      // if(state is QoutesLoaded){
      //   Int generaterandomqoute=Random().nextInt()
  
