//
//  ViewController.swift
//  TP1-Projet
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 na. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var posterMovieImageView: UIImageView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var subtitleMovieLabel: UILabel!
    @IBOutlet weak var categoryMovieLabel: UILabel!
    @IBOutlet weak var durationMovieLabel: UILabel!
    @IBOutlet weak var dateMovieLabel: UILabel!
    @IBOutlet weak var synopsisTitleLabel: UILabel!
    @IBOutlet weak var synopsisDescriptionLabel: UILabel!
    @IBOutlet weak var trailerMovieButton: UIButton!
    
    @IBOutlet var detailMovieView: UIView!
    
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let movieManager: MovieManager = MovieManager()
        movieManager.movieDetailsRequest { data in
            guard let data = data else { return }
            if let myMovie = try? JSONDecoder().decode(MovieResponse.self, from: data) {
                self.movie?.id = myMovie.id
                self.movie?.title = myMovie.title
                self.movie?.poster = myMovie.backdropPath
                self.movie?.synopsis = myMovie.overview
                self.movie?.duration = myMovie.runtime
                self.movie?.categories = myMovie.genres?.map({ Genre -> String in Genre.name})
                
                
            }
            
        }
        
        titleMovieLabel.text = movie?.title
        synopsisDescriptionLabel.text = movie?.synopsis
        categoryMovieLabel.text = movie?.categories?.joined(separator: "/")
  
    }
    
    
    @IBAction func playTrailer(_ sender: Any) {
      /* if let url = URL(string: movie.trailerUrl) {
            UIApplication.shared.open(url)
        }*/
    }
    
}

