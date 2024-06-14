// To parse this JSON data, do
//
//     final pokemonData = pokemonDataFromJson(jsonString);

import 'dart:convert';

PokemonData pokemonDataFromJson(String str) => PokemonData.fromJson(json.decode(str));

String pokemonDataToJson(PokemonData data) => json.encode(data.toJson());

class PokemonData {
    int? count;
    String? next;
    dynamic previous;
    List<Result>? results;

    PokemonData({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory PokemonData.fromJson(Map<String, dynamic> json) => PokemonData(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    String? name;
    String? url;

    Result({
        this.name,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
