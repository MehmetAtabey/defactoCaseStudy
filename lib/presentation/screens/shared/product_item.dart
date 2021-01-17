import 'package:defactoCaseStudy/core/model/movie.dart';
import 'package:defactoCaseStudy/core/provider/movie_provider.dart';
import 'package:defactoCaseStudy/core/utils/customalertdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  Search movie;
  ProductItem(this.movie);

  @override
  Widget build(BuildContext context) {
    void dialog(MovieProvider model) {
      var dialog = CustomAlertDialog(
          title: "Warning",
          message: "Are you sure, do you want to remove this from favorites?",
          onPostivePressed: () => model.setMoviesForFavorites(movie),
          positiveBtnText: 'Yes',
          negativeBtnText: 'No');
      showDialog(context: context, builder: (BuildContext context) => dialog);
    }

    return Consumer<MovieProvider>(
        builder: (context, model, child) => Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(7)),
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: AspectRatio(
                          aspectRatio: 0.8,
                          child: Image.network(
                            movie.poster,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(
                        movie.year,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Align(
                    child: IconButton(
                        icon: Icon(
                          model.favs.any(
                                  (element) => element.imdbId == movie.imdbId)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () => model.favs.any(
                                (element) => element.imdbId == movie.imdbId)
                            ? dialog(model)
                            : model.setMoviesForFavorites(movie)),
                    alignment: Alignment.bottomRight)
              ],
            ));
  }
}
