import 'package:defactoCaseStudy/core/enums/viewstate.dart';
import 'package:defactoCaseStudy/core/provider/movie_provider.dart';
import 'package:defactoCaseStudy/core/utils/alert_helper.dart';
import 'package:defactoCaseStudy/presentation/screens/favorites/favorites_screen.dart';
import 'package:defactoCaseStudy/presentation/screens/shared/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();

  void _submit(MovieProvider model) {
    FocusScope.of(context).unfocus();
    model.getMoviesByTitle(textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Defacto Case Study"),
                actions: [
                  RaisedButton(
                      child: Text(
                        "Favorites",
                        style: const TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoritesScreeen())))
                ],
              ),
              body: Container(
                color: Colors.white,
                child: Column(children: [
                  TextField(
                    onSubmitted: (val) => val.isEmpty
                        ? AlertHelper.showBasicDialog(
                            context, "Please enter a movie title")
                        : _submit(model),
                    controller: textController,
                    decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  Expanded(
                    child: model.state == ViewState.Busy
                        ? Container(
                            child: Center(child: CircularProgressIndicator()))
                        : GridView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(10),
                            scrollDirection: Axis.vertical,
                            itemCount: model.items.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.65),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductItem(model.items[index]);
                            },
                          ),
                  )
                ]),
              ),
            ));
  }
}
