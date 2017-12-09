//
//  ScoreboardTableViewCell.swift
//  project-karten
//
//  Created by Gabriel Freitas on 03/12/17.
//  Copyright © 2017 Gabriel Freitas. All rights reserved.
//

import UIKit

class ScoreboardTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var color: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
