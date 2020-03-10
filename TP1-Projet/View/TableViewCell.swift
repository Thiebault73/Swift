//
//  TableViewCell.swift
//  TP1-Projet
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 na. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieCellImageView: UIImageView!
    
    @IBOutlet weak var titleCellMovieLabel: UILabel!
    
    
    @IBOutlet weak var synopsisCellMovieLabel: UILabel!
    
    @IBOutlet weak var dateMovieCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
}
