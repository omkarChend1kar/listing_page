import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildPosterWidget(BuildContext context, String posterUrl) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.45,
    width: MediaQuery.of(context).size.width,
    child: Opacity(
      opacity: 0.7,
      child: CachedNetworkImage(
        imageUrl: posterUrl,
        fit: BoxFit.cover,
      ),
    ),
  );
}
