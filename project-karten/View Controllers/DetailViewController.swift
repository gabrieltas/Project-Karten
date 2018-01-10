//
//  DetailViewController.swift
//  project-karten
//
//  Created by Gabriel Freitas on 04/12/17.
//  Copyright © 2017 Gabriel Freitas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //Labels and Views
    @IBOutlet weak var totalPointsBackground: UIView!
    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var levelPoints: UILabel!
    @IBOutlet weak var gearPoints: UILabel!
    @IBOutlet weak var oneShotPoints: UILabel!
    @IBOutlet weak var levelText: UILabel!
    @IBOutlet weak var gearText: UILabel!
    @IBOutlet weak var oneShotText: UILabel!
    
    //Buttons
    @IBOutlet weak var addLevelPoints: UIButton!
    @IBOutlet weak var subtractLevelPoints: UIButton!
    @IBOutlet weak var addGearPoints: UIButton!
    @IBOutlet weak var subtractGearPoints: UIButton!
    @IBOutlet weak var addOneShotPoints: UIButton!
    @IBOutlet weak var subtractOneShotPoints: UIButton!
    
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = player.userName
        
        loadPlayerLabels()
        setVisualDetails()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        savePlayerLabels()
    }
    
    @IBAction func buttonTaped(sender: UIButton) {
        switch sender.tag {
        case 1: updatePoints(label: levelPoints, withAddButtonType: false)
            break
        case 2: updatePoints(label: levelPoints, withAddButtonType: true)
            break
        case 3: updatePoints(label: gearPoints, withAddButtonType: false)
            break
        case 4: updatePoints(label: gearPoints, withAddButtonType: true)
            break
        case 5: updatePoints(label: oneShotPoints, withAddButtonType: false)
            break
        case 6: updatePoints(label: oneShotPoints, withAddButtonType: true)
            break
        default: ()
            break
        }
    }
    
    func updatePoints(label: UILabel, withAddButtonType type: Bool) {
        var aux = 0
        
        if type == false {
            aux = Int(label.text!)! - 1
            totalPoints.text = (Int(totalPoints.text!)! - 1).description
        } else {
            aux = Int(label.text!)! + 1
            totalPoints.text = (Int(totalPoints.text!)! + 1).description
        }
        
        label.text = aux.description
    }
    
    func loadPlayerLabels() {
        totalPoints.text = player.userScore.description
        levelPoints.text = player.userLevel.description
        gearPoints.text = player.userGear.description
        oneShotPoints.text = player.userOneShot.description
    }
    
    func savePlayerLabels() {
        player.userScore = Int(totalPoints.text!)!
        player.userLevel = Int(levelPoints.text!)!
        player.userGear = Int(gearPoints.text!)!
        player.userOneShot = Int(oneShotPoints.text!)!
    }
    
    func setVisualDetails() {
        //Labels
        levelText.textColor = colors[player.userColor].get().dark
        gearText.textColor = colors[player.userColor].get().dark
        oneShotText.textColor = colors[player.userColor].get().dark
        
        levelPoints.textColor = colors[player.userColor].get().dark
        gearPoints.textColor = colors[player.userColor].get().dark
        oneShotPoints.textColor = colors[player.userColor].get().dark
        
        //Background View
        totalPointsBackground.backgroundColor = colors[player.userColor].get().normal
        
        //totalPointsBackground.layer.cornerRadius = 40.0
        //totalPointsBackground.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        totalPointsBackground.layer.shadowColor = UIColor.black.cgColor
        totalPointsBackground.layer.shadowOpacity = 0.08
        totalPointsBackground.layer.shadowOffset = CGSize.init(width: 0, height: 8)
        totalPointsBackground.layer.shadowRadius = 4
    }

}
