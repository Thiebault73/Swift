//
//  Movie.swift
//  TP1-Projet
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 na. All rights reserved.
//

import Foundation

struct Movie {
    var title: String?
    var id: Int?
    var categories: [String]?
    var duration: Int?
    var date: Int?
    var synopsis: String?
    var poster: String?
    
    init(from movieResponse: MovieResponse) {
        self.id = movieResponse.id!
        self.title = movieResponse.title!
        self.date = Int(String(movieResponse.releaseDate!.prefix(4)))!
        self.synopsis = movieResponse.overview!
        self.poster = "https://image.tmdb.org/t/p/w300" + movieResponse.backdropPath!
        self.categories = movieResponse.genres?.map({ Genre -> String in
            Genre.name
        })
        self.duration = movieResponse.runtime
    }
    
    
}
   

