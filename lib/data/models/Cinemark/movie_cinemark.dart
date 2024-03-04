class MovieCinemark {
    final String title;
    final String trailerUrl;
    final String graphicUrl;
    final String runtime;
    final String rating;
    final String filmHoCode;
    final String corporateFilmId;
    final String synopsis;
    final String synopsisAlt;
    final DateTime openingDate;
    final List<Cast> cast;
    final List<MovieVersion> movieVersions;

    MovieCinemark({
        required this.title,
        required this.trailerUrl,
        required this.graphicUrl,
        required this.runtime,
        required this.rating,
        required this.filmHoCode,
        required this.corporateFilmId,
        required this.synopsis,
        required this.synopsisAlt,
        required this.openingDate,
        required this.cast,
        required this.movieVersions,
    });

    factory MovieCinemark.fromJson(Map<String, dynamic> json) => MovieCinemark(
        title: json["title"],
        trailerUrl: json["trailer_url"],
        graphicUrl: json["graphic_url"],
        runtime: json["runtime"],
        rating: json["rating"],
        filmHoCode: json["film_HO_code"],
        corporateFilmId: json["corporate_film_id"],
        synopsis: json["synopsis"],
        synopsisAlt: json["synopsis_alt"],
        openingDate: DateTime.parse(json["opening_date"]),
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        movieVersions: List<MovieVersion>.from(json["movie_versions"].map((x) => MovieVersion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "trailer_url": trailerUrl,
        "graphic_url": graphicUrl,
        "runtime": runtime,
        "rating": rating,
        "film_HO_code": filmHoCode,
        "corporate_film_id": corporateFilmId,
        "synopsis": synopsis,
        "synopsis_alt": synopsisAlt,
        "opening_date": openingDate.toIso8601String(),
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "movie_versions": List<dynamic>.from(movieVersions.map((x) => x.toJson())),
    };
}

class Cast {
    final String id;
    final String firstName;
    final String lastName;
    final String personType;

    Cast({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.personType,
    });

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["ID"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        personType: json["PersonType"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "FirstName": firstName,
        "LastName": lastName,
        "PersonType": personType,
    };
}

class MovieVersion {
    final String filmHopk;
    final String title;
    final String filmHoCode;
    final String id;
    final List<Session> sessions;

    MovieVersion({
        required this.filmHopk,
        required this.title,
        required this.filmHoCode,
        required this.id,
        required this.sessions,
    });

    factory MovieVersion.fromJson(Map<String, dynamic> json) => MovieVersion(
        filmHopk: json["film_HOPK"],
        title: json["title"],
        filmHoCode: json["film_HO_code"],
        id: json["id"],
        sessions: List<Session>.from(json["sessions"].map((x) => Session.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "film_HOPK": filmHopk,
        "title": title,
        "film_HO_code": filmHoCode,
        "id": id,
        "sessions": List<dynamic>.from(sessions.map((x) => x.toJson())),
    };
}

class Session {
    final String id;
    final DateTime showtime;
    final DateTime day;
    final String hour;
    final int seatsAvailable;

    Session({
        required this.id,
        required this.showtime,
        required this.day,
        required this.hour,
        required this.seatsAvailable,
    });

    factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        showtime: DateTime.parse(json["showtime"]),
        day: DateTime.parse(json["day"]),
        hour: json["hour"],
        seatsAvailable: json["seats_available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "showtime": showtime.toIso8601String(),
        "day": "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "hour": hour,
        "seats_available": seatsAvailable,
    };
}
