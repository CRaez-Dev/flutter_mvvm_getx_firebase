class Movie {
  final int? id;
  final String name;
  final String synopsis;
  final String? trailerUrl;
  final String rating;
  final int duration;
  final String bannerUrl;
  final List<Casting>? casting;

  Movie({
    this.id,
    required this.name,
    required this.synopsis,
    this.trailerUrl,
    required this.duration,
    required this.bannerUrl,
    required this.rating,
    this.casting
  });
}


enum CastingType {
  director,
  actor
}

class Casting{  
  String fullName;
  CastingType type;

  Casting({
    required this.fullName,
    required this.type
  });
}
