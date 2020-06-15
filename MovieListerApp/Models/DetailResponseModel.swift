//
//  DetailResponseModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

class DetailResponseModel: BaseResponseModel {
    var title: String = ""
    var year: String = ""
    var rated: String = ""
    var released: String = ""
    var runtime: String = ""
    var genre: String = ""
    var director: String = ""
    var writer: String = ""
    var actors: String = ""
    var plot: String = ""
    var language: String = ""
    var country: String = ""
    var awards: String = ""
    var poster: String = ""
    var ratings: [RatingModel] = []
    var metascore: String = ""
    var imdbRating: String = ""
    var imdbVotes: String = ""
    var imdbID: String = ""
    var type: String = ""
    var dvd: String = ""
    var boxOffice: String = ""
    var production: String = ""
    var website: String = ""
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
    }
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        year = try container.decodeIfPresent(String.self, forKey: .year) ?? ""
        rated = try container.decodeIfPresent(String.self, forKey: .rated) ?? ""
        released = try container.decodeIfPresent(String.self, forKey: .released) ?? ""
        runtime = try container.decodeIfPresent(String.self, forKey: .runtime) ?? ""
        genre = try container.decodeIfPresent(String.self, forKey: .genre) ?? ""
        director = try container.decodeIfPresent(String.self, forKey: .director) ?? ""
        writer = try container.decodeIfPresent(String.self, forKey: .writer) ?? ""
        actors = try container.decodeIfPresent(String.self, forKey: .actors) ?? ""
        plot = try container.decodeIfPresent(String.self, forKey: .plot) ?? ""
        language = try container.decodeIfPresent(String.self, forKey: .language) ?? ""
        country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        awards = try container.decodeIfPresent(String.self, forKey: .awards) ?? ""
        poster = try container.decodeIfPresent(String.self, forKey: .poster) ?? ""
        ratings = try container.decodeIfPresent([RatingModel].self, forKey: .ratings) ?? []
        metascore = try container.decodeIfPresent(String.self, forKey: .metascore) ?? ""
        imdbRating = try container.decodeIfPresent(String.self, forKey: .imdbRating) ?? ""
        imdbVotes = try container.decodeIfPresent(String.self, forKey: .imdbVotes) ?? ""
        imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? ""
        boxOffice = try container.decodeIfPresent(String.self, forKey: .boxOffice) ?? ""
        production = try container.decodeIfPresent(String.self, forKey: .production) ?? ""
        website = try container.decodeIfPresent(String.self, forKey: .website) ?? ""

        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(year, forKey: .year)
        try container.encodeIfPresent(rated, forKey: .rated)
        try container.encodeIfPresent(released, forKey: .released)
        try container.encodeIfPresent(runtime, forKey: .runtime)
        try container.encodeIfPresent(genre, forKey: .genre)
        try container.encodeIfPresent(director, forKey: .director)
        try container.encodeIfPresent(writer, forKey: .writer)
        try container.encodeIfPresent(actors, forKey: .actors)
        try container.encodeIfPresent(plot, forKey: .plot)
        try container.encodeIfPresent(language, forKey: .language)
        try container.encodeIfPresent(country, forKey: .country)
        try container.encodeIfPresent(awards, forKey: .awards)
        try container.encodeIfPresent(poster, forKey: .poster)
        try container.encodeIfPresent(ratings, forKey: .ratings)
        try container.encodeIfPresent(metascore, forKey: .metascore)
        try container.encodeIfPresent(imdbRating, forKey: .imdbRating)
        try container.encodeIfPresent(imdbVotes, forKey: .imdbVotes)
        try container.encodeIfPresent(imdbID, forKey: .imdbID)
        try container.encodeIfPresent(boxOffice, forKey: .boxOffice)
        try container.encodeIfPresent(production, forKey: .production)
        try container.encodeIfPresent(website, forKey: .website)
        try super.encode(to: encoder)
    }
}

class RatingModel: BaseModel {
    var source: String = ""
    var value: String = ""
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
        value = try container.decodeIfPresent(String.self, forKey: .value) ?? ""

        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(source, forKey: .source)
        try container.encodeIfPresent(value, forKey: .value)

        try super.encode(to: encoder)
    }
}
