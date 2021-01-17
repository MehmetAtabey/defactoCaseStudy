import 'package:defactoCaseStudy/core/provider/movie_provider.dart';
import 'package:defactoCaseStudy/presentation/screens/shared/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreeen extends StatelessWidget {
  MovieProvider provider;
  FavoritesScreeen(this.provider);
  @override
  Widget build(BuildContext context) {
        return Consumer<MovieProvider>(
        builder: (context, model, child)  => Scaffold(
              appBar: AppBar(
                title: Text("Favorites"),
              ),
              body: Container(
                color: Colors.white,
                child: Column(children: [
                  Expanded(
                    child:GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: model.favs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.65),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItem(model.favs[index]);
                      },
                    ),
                  )
                ]),
              ),
            ));
  }
}