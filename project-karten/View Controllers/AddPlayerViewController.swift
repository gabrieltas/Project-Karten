//
//  AddPlayerViewController.swift
//  project-karten
//
//  Created by Gabriel Freitas on 04/12/17.
//  Copyright © 2017 Gabriel Freitas. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {

    var selectedIndex = 0
    let COLOR_COLLECTION_VIEW_HEIGHT = 85
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var playerName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let player = Player(name: playerName.text!, score: 0, gear: 0, level: 0, color: selectedIndex)
        
        if let destination = segue.destination as? ViewController {
            destination.players.append(player)
            destination.tableView.reloadData()
        }
    }

}

extension AddPlayerViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedIndex = indexPath.row
        
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layoutSubviews()
        cell.layoutIfNeeded()
        cell.setNeedsDisplay()
    }
    
}


extension AddPlayerViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "color", for: indexPath) as! ColorCollectionViewCell
        cell.color.backgroundColor = colors[indexPath.item].get().normal
        if indexPath.item == selectedIndex {
            cell.colorSelected.isHidden = false
        } else {
            cell.colorSelected.isHidden = true
        }
        cell.layoutSubviews()
        return cell
    }
}

extension AddPlayerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: COLOR_COLLECTION_VIEW_HEIGHT-2*5, height: COLOR_COLLECTION_VIEW_HEIGHT-2*5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let edge = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return edge
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
