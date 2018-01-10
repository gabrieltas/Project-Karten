//
//  ViewController.swift
//  project-karten
//
//  Created by Gabriel Freitas on 03/12/17.
//  Copyright © 2017 Gabriel Freitas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var players = [Player]()
    var selectedItem: Int!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableView.separatorColor = UIColor.clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sortPlayers()
        tableView.reloadData()
        hideTableViewIfIsEmpty()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveData()
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        print(players.count)
        saveData()
        tableView.reloadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey:  "players"), let obj = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Player] {
            players = obj
        } else {
            print("There is an issue")
        }
    }
    
    func saveData() {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: players)
        UserDefaults.standard.set(encodedData, forKey: "players")
    }
    
    func hideTableViewIfIsEmpty() {
        if tableView.numberOfRows(inSection: 0) == 0 {
            self.tableView.alpha = 0
        } else {
            self.tableView.alpha = 1
        }
    }
    
    func sortPlayers() {
        players.sort {
            $0.userScore > $1.userScore
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let destination = segue.destination as? DetailViewController {
                destination.player = players[selectedItem]
         
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreboardTableViewIdentifier") as! ScoreboardTableViewCell
        
        //Cell Fields
        cell.name.text = players[indexPath.item].userName
        cell.points.text = players[indexPath.item].userScore.description
        cell.level.text = players[indexPath.item].userLevel.description
        cell.color.backgroundColor = colors[players[indexPath.item].userColor].get().normal
        
        //Cell Position
        let aux = indexPath.item + 1
        cell.position.text = "\(aux.description)#"
        
        //Cell Design
        cell.position.textColor = colors[players[indexPath.item].userColor].get().normal
        cell.points.textColor = colors[players[indexPath.item].userColor].get().normal
        
        cell.color.layer.cornerRadius = 8.0
        cell.color.layer.shadowColor = UIColor.black.cgColor
        cell.color.layer.shadowOpacity = 0.08
        cell.color.layer.shadowOffset = CGSize.init(width: 0, height: 7)
        cell.color.layer.shadowRadius = 4
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = indexPath.item
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            players.remove(at: indexPath.item)
            
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top)
            
            saveData()
            
            print(players.count)
            
            self.hideTableViewIfIsEmpty()
        }
    }
}

