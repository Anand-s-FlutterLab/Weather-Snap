import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
    int id;
    String name;
    String region;
    String country;
    double lat;
    double lon;
    String url;

    SearchModel({
        required this.id,
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.url,
    });

    SearchModel copyWith({
        int? id,
        String? name,
        String? region,
        String? country,
        double? lat,
        double? lon,
        String? url,
    }) => 
        SearchModel(
            id: id ?? this.id,
            name: name ?? this.name,
            region: region ?? this.region,
            country: country ?? this.country,
            lat: lat ?? this.lat,
            lon: lon ?? this.lon,
            url: url ?? this.url,
        );

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "url": url,
    };
}
