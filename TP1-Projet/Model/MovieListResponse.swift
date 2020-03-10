//
//  MovieListResponse.swift
//  TP1-Projet
//
//  Created by  on 06/03/2020.
//  Copyright © 2020 na. All rights reserved.
//

import Foundation

struct MovieListResponse: Decodable {
    let page, totalResults, totalPages: Int
    let results: [MovieResponse]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    func transformMovie() -> [Movie] {
        return self.results.map { (MovieResponse) -> Movie in
            Movie(from: MovieResponse)
        }
    }
}
