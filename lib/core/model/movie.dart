import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
    Movie({
        this.search,
        this.totalResults,
        this.response,
    });

    final List<Search> search;
    final String totalResults;
    final String response;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        search: List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
    );

    Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
    };
}

class Search {
    Search({
        this.title,
        this.year,
        this.imdbId,
        this.type,
        this.poster,
    });

    final String title;
    final String year;
    final String imdbId;
    final Type type;
    final String poster;

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map[json["Type"]],
        poster: json["Poster"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse[type],
        "Poster": poster,
    };
}

enum Type { SERIES, MOVIE }

final typeValues = EnumValues({
    "movie": Type.MOVIE,
    "series": Type.SERIES
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
