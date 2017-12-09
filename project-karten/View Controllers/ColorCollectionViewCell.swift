//
//  ColorCollectionViewCell.swift
//  project-karten
//
//  Created by Barbara Kudiess on 12/1/17.
//  Copyright © 2017 SpaceWalk. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var color: UIView!
    @IBOutlet weak var colorSelected: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        color.layer.cornerRadius = color.frame.width*0.5
        colorSelected.layer.cornerRadius = colorSelected.frame.width*0.5
        
        colorSelected.layer.borderWidth = 2
        colorSelected.layer.borderColor = color.backgroundColor?.cgColor
        colorSelected.backgroundColor = UIColor.white
        
        layoutIfNeeded()
    }
}
