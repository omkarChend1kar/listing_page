import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_listing_ui/models/characters_entity_model.dart';

Widget buildCharacterWidget(
    BuildContext context, List<CharacterEntityModel> listOfCharacters) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 1.4,
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listOfCharacters.length,
      itemBuilder: (context, index) {
        ///
        final characterImagePath = listOfCharacters[index].imagePath;

        ///
        final characterImageUrl =
            'https://demo.tech2edge.co/samples/$characterImagePath';

        ///
        final characterName = listOfCharacters[index].characterName;

        ///
        final profession = listOfCharacters[index].profession;

        ///
        final characterAge = listOfCharacters[index].age;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: CachedNetworkImage(
                    imageUrl: characterImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        characterName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Profession : $profession',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Age : $characterAge',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    ),
  );
}
