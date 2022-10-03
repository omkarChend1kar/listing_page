import 'package:flutter/material.dart';
import 'package:movies_listing_ui/apiservice/api_service.dart';
import 'package:movies_listing_ui/models/characters_entity_model.dart';
import 'package:movies_listing_ui/widgets/build_character_widget.dart';

Widget buildOverViewWidget(BuildContext context, String title, String overview,
    ApiService apiService) {
  return SafeArea(
    minimum: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.4,
    ),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 5,
                width: 100,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Overview',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              overview,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Characters',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<CharacterEntityModel>?>(
              future: apiService.getCharactorsDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    ///
                    final listOfCharacters = snapshot.data;

                    ///
                    return buildCharacterWidget(
                      context,
                      listOfCharacters!,
                    );
                  } else {
                    return const SizedBox();
                  }
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}
