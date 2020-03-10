//
//  MovieResponseDetails.swift
//  TP1-Projet
//
//  Created by  on 06/03/2020.
//  Copyright © 2020 na. All rights reserved.
//

import Foundation
struct MovieResponseDetails: Decodable {
    
    let posterPath: String
    let id: Int
    let originalTitle: String
    let genreIDS: [Int]
    let title: String
    let overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case overview
        case releaseDate = "release_date"
    }
}
