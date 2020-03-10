//
//  Request.swift
//  TP1-Projet
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 na. All rights reserved.
//

import Foundation

struct MovieManager {
    // constantes pour faire les différentes requêtes
    let credentials: String = "?api_key=30101dc88844c8ff128810dcd6676353"
    let language: String = "&language=fr-FR"
    let api: String = "https://api.themoviedb.org/3"
    let urlRequestDetails: String = "/movie"
    let urlRequest: String = "/discover/movie"
    let urlGenre: String = "/genre/movie/list"
    let session = URLSession.shared
    var movie: Movie?
    
    // Requête qui récupère la liste des films
    func movieRequest(completion: @escaping ((Data?) -> Void)) {
        session.dataTask(with: URL(string: api + urlRequest + credentials + language)!, completionHandler: {(data, response, error) in
                if let data = data {
                    completion(data)
                    
                }
            }).resume()
    }
    
    // Requête qui récupère le détails d'un film
   func movieDetailsRequest(completion: @escaping ((Data?) -> Void)) {
        session.dataTask(with: URL(string: api + urlRequestDetails + "/\(String(describing: movie?.id))" + credentials + language)!, completionHandler: {(data, response, error) in
            if let data = data {
                completion(data)
            }
        }).resume()
    }
    
    // Requête qui récupère les genre d'un film
    func genreRequest(completion: @escaping ((Data?) -> Void)) {
        session.dataTask(with: URL(string: api + urlGenre + credentials + language)!, completionHandler: {(data, response, error) in
            if let data = data {
                completion(data)
            }
        }).resume()
    }
    
}








