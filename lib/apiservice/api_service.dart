import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies_listing_ui/models/characters_entity_model.dart';
import 'package:movies_listing_ui/models/series_entity_model.dart';

class ApiService {
  ///
  Future<Response> request = http.get(
    Uri.parse('https://demo.tech2edge.co/samples/data-sg'),
  );

  ///
  Future<List<CharacterEntityModel>?> getCharactorsDetails() {
    return request.then((response) {
      try {
        if (response.statusCode == 200) {
          ///
          final rawJson = jsonDecode(response.body);

          ///
          final List<dynamic> charactersIterable = rawJson['characters'];

          ///
          final result = List<CharacterEntityModel>.from(
            charactersIterable.map(
              (json) => CharacterEntityModel.fromJson(json),
            ),
          );
          return result;
        }
      } catch (e) {
        rethrow;
      }
      return null;
    });
  }

  ///
  Future<ServiceEntityModel?> getSeriesDetails() {
    return request.then((response) {
      try {
        if (response.statusCode == 200) {
          ///
          final rawJson = jsonDecode(response.body);

          ///
          final json = rawJson['series'];

          ///
          final result = ServiceEntityModel.fromJson(json);
          return result;
        }
      } catch (e) {
        rethrow;
      }
      return null;
    });
  }
}
