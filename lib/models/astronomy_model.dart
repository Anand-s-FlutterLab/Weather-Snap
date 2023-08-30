// To parse this JSON data, do
//
//     final astronomyModel = astronomyModelFromJson(jsonString);

import 'dart:convert';

AstronomyModel astronomyModelFromJson(String str) => AstronomyModel.fromJson(json.decode(str));

String astronomyModelToJson(AstronomyModel data) => json.encode(data.toJson());

class AstronomyModel {
    Location location;
    Astronomy astronomy;

    AstronomyModel({
        required this.location,
        required this.astronomy,
    });

    AstronomyModel copyWith({
        Location? location,
        Astronomy? astronomy,
    }) => 
        AstronomyModel(
            location: location ?? this.location,
            astronomy: astronomy ?? this.astronomy,
        );

    factory AstronomyModel.fromJson(Map<String, dynamic> json) => AstronomyModel(
        location: Location.fromJson(json["location"]),
        astronomy: Astronomy.fromJson(json["astronomy"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "astronomy": astronomy.toJson(),
    };
}

class Astronomy {
    Astro astro;

    Astronomy({
        required this.astro,
    });

    Astronomy copyWith({
        Astro? astro,
    }) => 
        Astronomy(
            astro: astro ?? this.astro,
        );

    factory Astronomy.fromJson(Map<String, dynamic> json) => Astronomy(
        astro: Astro.fromJson(json["astro"]),
    );

    Map<String, dynamic> toJson() => {
        "astro": astro.toJson(),
    };
}

class Astro {
    String sunrise;
    String sunset;
    String moonrise;
    String moonset;
    String moonPhase;
    String moonIllumination;
    int isMoonUp;
    int isSunUp;

    Astro({
        required this.sunrise,
        required this.sunset,
        required this.moonrise,
        required this.moonset,
        required this.moonPhase,
        required this.moonIllumination,
        required this.isMoonUp,
        required this.isSunUp,
    });

    Astro copyWith({
        String? sunrise,
        String? sunset,
        String? moonrise,
        String? moonset,
        String? moonPhase,
        String? moonIllumination,
        int? isMoonUp,
        int? isSunUp,
    }) => 
        Astro(
            sunrise: sunrise ?? this.sunrise,
            sunset: sunset ?? this.sunset,
            moonrise: moonrise ?? this.moonrise,
            moonset: moonset ?? this.moonset,
            moonPhase: moonPhase ?? this.moonPhase,
            moonIllumination: moonIllumination ?? this.moonIllumination,
            isMoonUp: isMoonUp ?? this.isMoonUp,
            isSunUp: isSunUp ?? this.isSunUp,
        );

    factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
        isMoonUp: json["is_moon_up"],
        isSunUp: json["is_sun_up"],
    );

    Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
    };
}

class Location {
    String name;
    String region;
    String country;
    double lat;
    double lon;
    String tzId;
    int localtimeEpoch;
    String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    Location copyWith({
        String? name,
        String? region,
        String? country,
        double? lat,
        double? lon,
        String? tzId,
        int? localtimeEpoch,
        String? localtime,
    }) => 
        Location(
            name: name ?? this.name,
            region: region ?? this.region,
            country: country ?? this.country,
            lat: lat ?? this.lat,
            lon: lon ?? this.lon,
            tzId: tzId ?? this.tzId,
            localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
            localtime: localtime ?? this.localtime,
        );

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
