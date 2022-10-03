import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_listing_ui/apiservice/api_service.dart';
import 'package:movies_listing_ui/models/series_entity_model.dart';
import 'package:movies_listing_ui/widgets/buildPosterWIdget.dart';
import 'package:movies_listing_ui/widgets/build_overview_widget.dart';

class HomePage extends StatelessWidget {
  ///
  HomePage({super.key});

  ///
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: FutureBuilder<ServiceEntityModel?>(
          future: apiService.getSeriesDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                ///
                final posterPath = snapshot.data!.posterImage;

                ///
                final String posterUrl =
                    'https://demo.tech2edge.co/samples/$posterPath';

                ///
                final title = snapshot.data!.title;

                ///
                final overview = snapshot.data!.description;
                return Stack(
                  children: [
                    buildPosterWidget(context, posterUrl),
                    buildOverViewWidget(context, title, overview, apiService),
                  ],
                );
              } else {
                return const SizedBox();
              }
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
