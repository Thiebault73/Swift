//
//  MovieResponse.swift
//  TP1-Projet
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 na. All rights reserved.
//

import Foundation


struct MovieResponse: Decodable {
    
    let id: Int?
    let backdropPath: String?
    let genres: [Genre]?
    let title: String?
    let overview, releaseDate: String?
    let runtime: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case genres = "genres_ids"
        case title
        case overview
        case releaseDate = "release_date"
        case runtime
    }
   
}





