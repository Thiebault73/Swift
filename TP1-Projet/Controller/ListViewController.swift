//
//  ListViewController.swift
//  TP1-Projet
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 na. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    let cellId: String = "CellID"
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: cellId)
        tableView.reloadData()
        // initialisation de MovieManager, class qui exécute les requêtes
        let movieManager: MovieManager = MovieManager()
        
        movieManager.movieRequest { data in
            guard let data = data else { return }
            if let listMovies = try? JSONDecoder().decode(MovieListResponse.self, from: data) {
                self.movies = listMovies.transformMovie()
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailsController = segue.destination as? ViewController,
            let index = tableView.indexPathForSelectedRow?.row
            else {
               return
        }
        detailsController.movie = movies[index]
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        
        let tabMovie = movies[indexPath.item]
        let urlPoster = URL(string: tabMovie.poster!)
        getData(from: urlPoster!) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? urlPoster!.lastPathComponent)
            
            DispatchQueue.main.async() {
                cell.movieCellImageView.image = UIImage(data: data)
                cell.titleCellMovieLabel.text = tabMovie.title
                cell.dateMovieCellLabel.text = String(tabMovie.date!)
                cell.synopsisCellMovieLabel.text = tabMovie.synopsis
            }
        }
        
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = movies[indexPath.row]
        self.performSegue(withIdentifier: "segueMovieDetails", sender: selectedCell)
    }
    
    
    
    
    
    

}
