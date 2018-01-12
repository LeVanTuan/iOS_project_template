//
//  Movie.swift
//  iOSProjectTemplate
//
//  Created by Tuan LE on 1/12/18.
//  Copyright © 2018 Leo LE. All rights reserved.
//

import Foundation
import ObjectMapper

struct Movie: Mappable {
    
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var voteCount: Int = 0
    var video: Bool = false
    var voteAverage: Double = 0
    var popularity: Double = 0
    var posterPath: String = ""
    var originalLanguage: String = ""
    var originalTitle: String = ""
    var genreIds: [Int] = []
    var backdropPath: String = ""
    var adult: Bool = false
    var releaseDate: String = ""
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.overview <- map["overview"]
        self.voteCount <- map["vote_count"]
        self.video <- map["video"]
        self.voteAverage <- map["vote_average"]
        self.popularity <- map["popularity"]
        self.posterPath <- map["poster_path"]
        self.originalLanguage <- map["original_language"]
        self.originalTitle <- map["original_title"]
        self.genreIds <- map["genre_ids"]
        self.backdropPath <- map["backdrop_path"]
        self.adult <- map["adult"]
        self.releaseDate <- map["release_date"]
    }
}
